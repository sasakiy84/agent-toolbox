---
name: sasakiy-create-issue
description: Create repository-local Markdown issues under issues/ using Sasakiy-style rules through user dialogue. Use when Codex needs to clarify the minimum implementation intent with the user, add a new issue file, choose the next issues/SEQUENCE number, select a category, fill template fields, create bug or task issues from findings, or prepare an issue creation commit.
---

# Sasakiy Create Issue

`issues/` 配下に新規 issue を作成するときに使う。先に `$sasakiy-issues` を読み、git 操作をする場合は `$sasakiy-git` を使う。リポジトリの `AGENTS.md` と `issues/0000-template.md` があれば必ず優先する。

## 作成前に読む

- `AGENTS.md`
- `issues/0000-template.md`
- `issues/SEQUENCE`
- 直近の open issue と `issues/closed/` の近い種類の issue
- 必要なら `CHANGES.md`

GitHub Issues には作成しない。リポジトリ内の Markdown issue を正とする。

## ユーザーとの対話

create-issue では、実装可能性の詳細まで詰め切らなくてよい。まず「何をしたい issue か」がブレない最低限の意図を、ユーザーと対話して作る。

最初に以下を短く確認する。

1. 何を追加・変更・修正・調査したいか。
2. なぜ必要か。ユーザー影響、開発上の困りごと、リリース都合など。
3. 期待する完了状態。何ができれば issue を閉じられるか。
4. 対象になりそうな機能、ファイル、画面、API、コマンド。
5. やらないこと、後回しにすること。

ユーザーの説明が曖昧な場合は、一度に多く聞かない。まず最も詰まっている 1-3 点だけ聞く。例:

- 「これはバグ修正、機能追加、調査のどれとして起票しますか」
- 「完了条件は、テスト追加まで含めますか、それとも調査結果の記録までですか」
- 「対象範囲はこのモジュールだけですか、関連する SDK / サンプルも含めますか」

リポジトリを読めば分かる情報はユーザーに聞かず、自分で確認する。ユーザーに聞くのは、目的、優先度、スコープ、受け入れ条件など、外から決めるべき意図に限る。

## 最低限の作成単位

新規作成時点の issue は、polish 済みでなくてもよい。ただし以下が空のままなら作成しない。

- `目的`: 何のための issue か。
- `優先度根拠`: なぜ High / Medium / Low なのか。
- `現状`: 分かっている範囲の現状、または未調査なら未調査であること。
- `設計方針`: 最低限の方向性。詳細未定なら、何を調査して決めるか。
- `完了条件`: close できる条件。

ユーザーとの対話でまだ決まっていない点は、本文に「未確定」や「要確認」として残してよい。ただし未確定事項は、誰が何を確認すれば決まるかまで書く。

## 採番とファイル名

1. `issues/SEQUENCE` の値を読む。
2. その番号を 5 桁ゼロ埋めで使う。
3. ファイル名は `{seqnum5}-{category}-{short-description}.md` にする。
4. 作成後、`issues/SEQUENCE` を次の番号に更新する。

category は `add`、`bug`、`change`、`docs`、`enhance`、`feature`、`fix`、`fmt`、`investigate`、`other`、`refactor`、`test` を基本にする。リポジトリ固有の命名規則がある場合は、`feature-add-...` や `bug-fix-...` のような複合形も含めて既存 issue に合わせる。

## ヘッダー

テンプレートがある場合はその項目を使う。先頭ヘッダーは Markdown のリスト形式で書く。基本項目:

- `- Priority: High / Medium / Low`
- `- Created: YYYY-MM-DD`
- `- Completed: {YYYY-MM-DD}` または空欄
- `- Model: <model-name> <version>`
- `- Branch: <branch name>`
- `- Polished: YYYY-MM-DD`
- `- Reporter: @user`

`Created` は作成日を入れる。`Completed` は作成時点では完了にしない。`Polished` は、作成時点で実装着手可能な粒度まで磨いた場合だけ入れる。`Reporter` はフィードバックやバグ報告由来の場合だけ使う。

## Branch フィールド

`Branch` はテンプレートにある場合だけ使う。ブランチ戦略や命名規則はこのスキルでは前提にしない。ユーザー指示またはリポジトリ固有の規約でブランチ名が決まっている場合だけ記載する。

## 本文

テンプレートがある場合は維持する。基本セクション:

- `## 目的`
- `## 優先度根拠`
- `## 現状`
- `## 設計方針`
- `## 完了条件`
- `## 解決方法`

作成時点で少なくとも以下を書く。

- なぜ必要か。
- 現状のどこが問題か。
- 対象範囲と対象外。
- 最低限の実装意図。
- テスト方針。
- `CHANGES.md` 更新が必要か。
- 完了条件。

バグ issue では再現手順、期待動作、現状動作、影響範囲、境界条件を書く。レビューで見つかった問題から起票する場合は、レビュー指摘の要点と対象箇所を issue 本文に落とす。

## 作成品質

- 根拠はリポジトリ内のコード、テスト、ドキュメント、issue、コミット履歴で確認できる事実に限る。
- 推測は推測として書く。
- 行番号は変わりやすいため、シンボル名や grep 可能な語も併記する。
- issue 単体で実装者が迷わない粒度にする。
- 未確定の設計判断が大きい場合は `investigate` や `pending` を検討する。

## 作成後

- `issues/SEQUENCE` が更新済みか確認する。
- Markdown format が崩れていないか確認する。
- issue 作成をコミットする場合は `$sasakiy-git` に従い、コミットメッセージに issue 番号とタイトルを含める。
