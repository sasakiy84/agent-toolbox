---
name: sasakiy-review-diff-code
description: Strict Japanese code review for the current diff or a specified patch. Use when Codex needs to review uncommitted changes, staged changes, a commit range, PR diff, or implementation diff; prioritize bugs, regressions, missing tests, changelog mismatch, issue completion gaps, maintainability, security, and UI issues with concrete file/line findings.
---

# Sasakiy Review Diff Code

差分コードレビューを行うときに使う。レビューは日本語で、かなり厳しく、シンプルに、指摘内容を明確・具体的に、優先順位をつけて重要なものから書く。変更点と `CHANGES.md` / リリースノートの整合性も確認する。

## 入力確認

まず対象差分を確定する。

- ユーザーが範囲を指定した場合はその範囲。
- 指定がない場合は、作業ツリー差分と staged 差分。
- PR や commit range の場合は base と head。

必要に応じて読む。

- `AGENTS.md`
- 対応 issue (`issues/*.md`)
- `CHANGES.md`
- 変更対象の周辺コードとテスト
- 関連する closed issue や過去コミット本文

## レビュー観点

優先するのは次の順。

1. 実バグ、データ破壊、クラッシュ、セキュリティ、競合、未処理エラー。
2. issue の完了条件を満たしていない差分。
3. 互換性や公開 API / CLI / 設定 / 出力形式の意図しない変更。
4. テスト不足、エラーパス不足、境界値不足、flaky 化。
5. `CHANGES.md` の不足、種別ミス、最終差分と違う記載。
6. リポジトリ規約違反、コメント・ログ言語、命名、フォーマット。

`$sasakiy-testing`、`$sasakiy-ui`、`$sasakiy-japanese-writing`、各言語やフレームワークの skill が対象に合う場合は、それらの観点も使う。

スタイルだけの指摘は、実害や保守上の問題がある場合に絞る。

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

## 差分の読み方

- diff の変更行だけで判断しない。変更先の関数全体、呼び出し元、テスト、設定を読む。
- 追加コードだけでなく削除コードの意味を見る。
- issue 本文の `完了条件` と差分を照合する。
- `CHANGES.md` が必要な変更なのにない場合は指摘する。
- `CHANGES.md` がある場合は、変更内容、種別、配置、担当者行、最終差分との整合性を見る。
- テストが追加されている場合は、そのテストが実際に回帰を検知するかを見る。

## 出力形式

findings を先に書く。重要度順に並べる。各 finding はファイルと行を示し、何が問題で、どんな条件で壊れ、どう直すべきかを具体的に書く。

形式:

```markdown
- [重大度] `path/to/file:line` 問題の要約
  具体的な理由。必要なら再現条件、影響、修正方針を書く。
```

重大度は `Critical`、`High`、`Medium`、`Low` のいずれかを使う。リポジトリ固有のレビュー表現が別にあれば合わせる。

findings の後に必要なら以下を書く。

- Open questions
- Test gaps
- Summary

問題がない場合は「指摘なし」と明確に言い、残るリスクや未実行テストがあれば短く書く。

## issue 起票

レビューで別 issue にすべき問題を見つけた場合は、勝手に混ぜて直さない。必要に応じて `$sasakiy-create-issue` で起票し、元 issue に必要なメモを追加する。

## 禁止事項

- 根拠のない推測を断定しない。
- 「好み」だけの指摘を重大扱いしない。
- 差分外の大規模リファクタを要求しない。
- 変更点とリリースノートの整合性確認を省かない。
- 問題があるのに summary だけで済ませない。
