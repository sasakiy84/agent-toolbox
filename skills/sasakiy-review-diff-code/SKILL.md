---
name: sasakiy-review-diff-code
description: Strict Japanese code review for the current diff or a specified patch. Use when Codex needs to review uncommitted changes, staged changes, a commit range, PR diff, or implementation diff; prioritize bugs, regressions, missing tests, changelog mismatch, and issue completion gaps with concrete file/line findings.
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

スタイルだけの指摘は、実害や保守上の問題がある場合に絞る。

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
