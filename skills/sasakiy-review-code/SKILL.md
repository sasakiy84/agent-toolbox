---
name: sasakiy-review-code
description: Strict Japanese review of existing code, modules, issues, or repository state beyond a single diff. Use when Codex needs to audit code quality, find bugs in current implementation, review an issue or subsystem, compare implementation to requirements, inspect tests, check maintainability, security, UI, or produce prioritized findings without necessarily having a patch.
---

# Sasakiy Review Code

既存コードや特定モジュール、issue、リポジトリ状態をレビューするときに使う。差分レビューなら `$sasakiy-review-diff-code` を優先する。レビューは日本語で、かなり厳しく、シンプルに、指摘内容を明確・具体的に、優先順位をつけて重要なものから書く。

## 入力確認

レビュー対象を確定する。

- 特定ファイル、モジュール、機能、issue、テスト、リリース前確認。
- 対象が曖昧なら、リポジトリのエントリポイント、README、`AGENTS.md`、関連 issue から範囲を絞る。

必要に応じて読む。

- `AGENTS.md`
- `CODEBASE.md`
- 関連 issue と `issues/closed/`
- `CHANGES.md`
- README / docs
- テスト、CI、ビルド設定
- 関連コミットの本文

## レビュー観点

優先順:

1. 実バグ、クラッシュ、データ破壊、競合、リソースリーク、セキュリティ。
2. 仕様・issue・README・公開 API との不一致。
3. テスト不足、境界値不足、エラーパス不足、flaky なテスト。
4. リリースノート・`CHANGES.md`・互換性説明の不足。
5. 保守上の broken window、重複実装、責務境界の曖昧さ。
6. リポジトリ規約違反。

`$sasakiy-testing`、`$sasakiy-ui`、`$sasakiy-japanese-writing`、各言語やフレームワークの skill が対象に合う場合は、それらの観点も使う。

## 実装品質の観点

- 既存コードの命名、責務分割、エラー処理、テストの書き方に合っているか。
- 新しい抽象化が、実際の重複や複雑性を減らしているか。将来の拡張を見越した過剰な一般化になっていないか。
- 関数を細かく切りすぎてコードジャンプを増やしていないか。意味的に 1 つの処理なら、長さより読みやすい構造を優先しているか。
- コードジャンプが増えるだけの wrapper 関数や wrapper class がないか。
- 一般的すぎて何をしているのか分からない命名がないか。
- 定数や型エイリアスが、利用箇所から不必要に離れていないか。
- 一定以上の SQL / HTML / CSS / JS が、インラインではなく専用ファイルで管理されているか。
- コメントが処理内容の説明ではなく、理由、制約、互換性、外部 API の癖、過去の不具合回避を説明しているか。
- 長い関数や複雑な条件分岐が、レビューしやすい単位で区切られているか。
- データ型や table 定義で、コードから読み取れないフィールドの意味が補足されているか。
- secret、token、credential、個人情報がログやテストデータに含まれていないか。
- エラーを握りつぶしていないか。

## 文書と文体の観点

- 成果物に現在の仕様だけが残っているか。過去の議論や不採用案が残っていないか。
- 将来の変更に影響する設計上のトレードオフが、理由付きで簡潔に残っているか。
- 複数ファイルをまたぐ機能で、必要な `docs/` や `README.md` の更新が抜けていないか。
- ファイル冒頭に、必要な目的、役割、利用方法が書かれているか。

ドキュメントは別に書いているので考慮しない、と `AGENTS.md` にあるリポジトリでは、コードレビュー時にドキュメント改善を主指摘にしない。ただし `CHANGES.md` との整合性は確認する。

## 確認方法

- `rg` でシンボル、呼び出し元、テストをたどる。
- public API や設定は、作成・更新・利用・テストの全経路を見る。
- エラーパスと境界値を見る。
- issue の完了条件や `解決方法` と実装が一致するかを見る。
- 過去の review 指摘や polish コミットがある場合は、同じ問題が再発していないか見る。
- テストがある場合は、何を検知できて何を検知できないかを確認する。

## 出力形式

findings を先に、重要度順に書く。各 finding はファイルと行を示し、問題、影響、根拠、修正方針を具体的に書く。

```markdown
- [High] `src/example.rs:123` 境界値で panic する
  `foo()` は空配列でも呼ばれるが、ここで `items[0]` を参照している。...
```

重大度は `Critical`、`High`、`Medium`、`Low` を使う。問題がなければ「指摘なし」と明確に書き、残るリスクや未実行テストを短く添える。

## issue 化

レビューで作業が必要な問題を見つけた場合、対応をその場で混ぜない。ユーザーが求めた場合、または issue 化が必要な場合は `$sasakiy-create-issue` で issue 化する。issue を磨く必要があるなら `$sasakiy-polish-issue` を使う。

## 禁止事項

- 実コードを読まずに一般論で指摘しない。
- 行番号だけを見て周辺コードを読まない。
- 重大度を水増ししない。
- 好みのリファクタをバグとして扱わない。
- 変更点とリリースノートの整合性確認を忘れない。
