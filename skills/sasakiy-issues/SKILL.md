---
name: sasakiy-issues
description: Repository-local issue management for projects that keep issues as Markdown files under issues/ instead of GitHub Issues. Use when Codex needs to create, polish, triage, reopen, move, close, or implement an issue file, update issues/SEQUENCE, decide open/closed/pending placement, or derive a branch/task from an issue.
---

# Sasakiy Issues

このスキルは、GitHub Issues ではなくリポジトリ内の `issues/` ディレクトリで issue を管理するために使う。issue を作成・整理・実装・close するときは、まずリポジトリの `AGENTS.md` と `issues/0000-template.md` があれば読む。リポジトリ固有の記載がこのスキルと違う場合は、リポジトリ固有の記載を優先する。

## 基本方針

- issue は Markdown ファイルとして `issues/` に置く。
- open な issue は `issues/` 直下、完了した issue は `issues/closed/`、設計判断や外部要因で保留する issue は `issues/pending/` に置く。
- 番号が小さい issue から順に対応する。
- `issues/SEQUENCE` を採番元にする。新規 issue を作成したら、使った番号の次の値へ `issues/SEQUENCE` を更新する。
- issue 番号は常に 5 桁ゼロ埋めにする。
- GitHub Issue へ転記しない。リポジトリ内の issue ファイルを正とする。
- issue を作成・移動・close したら、その変更をコミット対象にする。コミット操作は `$sasakiy-git` を使う。

## ファイル名

ファイル名は `{seqnum5}-{category}-{short-description}.md` にする。

category は以下を基本にする:

- `add`
- `bug`
- `change`
- `docs`
- `enhance`
- `feature`
- `fix`
- `fmt`
- `investigate`
- `other`
- `refactor`
- `test`

リポジトリ固有の命名規則がある場合は、複合 category も含めて既存 issue の命名に合わせる。

## issue 本文

新規 issue は `issues/0000-template.md` があればそれを写して作る。テンプレートがない場合は、既存 issue の最新の open issue か closed issue に合わせる。

先頭ヘッダーは Markdown のリスト形式で書く。基本項目:

- `- Priority: High / Medium / Low`
- `- Created: YYYY-MM-DD`
- `- Completed: YYYY-MM-DD`
- `- Model: <model-name> <version>`
- `- Branch: <branch name>`
- `- Polished: YYYY-MM-DD`
- `- Reporter: @user`

`Completed` は完了前なら `{YYYY-MM-DD}` のままにしてよい。`Polished` と `Reporter` は既存テンプレートにある場合だけ使う。

本文セクション:

- `## 目的`
- `## 優先度根拠`
- `## 現状`
- `## 設計方針`
- `## 完了条件`
- `## 解決方法`

issue は、その issue だけで実装判断ができる粒度まで磨く。少なくとも、なぜ必要か、現状の問題、対象範囲、対象外、実装方針、テスト方針、完了条件を明確にする。リポジトリ内で確認した事実と、推測・方針・未確定事項を混ぜない。

## 優先度

- `High`: 最優先で対応する issue。
- `Medium`: 優先的に対応する issue。
- `Low`: 時間があれば対応する issue。

優先度は必ず根拠を書く。ユーザー影響、再現性、リリースブロッカー、データ破壊、テスト不能、保守上の broken window など、リポジトリから確認できる事実で説明する。

## issue を作成する

1. `AGENTS.md`、`issues/0000-template.md`、既存 issue の命名と本文を確認する。
2. `issues/SEQUENCE` から次の番号を読む。
3. 5 桁ゼロ埋めの番号でファイル名を決め、`issues/` 直下に Markdown ファイルを作る。
4. `Created` に今日の日付を入れる。
5. テンプレートに `Branch` があり、ユーザー指示またはリポジトリ固有の規約でブランチ名が決まっている場合だけ入れる。
6. `issues/SEQUENCE` を次の番号へ更新する。
7. issue 作成のコミットを作る場合は、コミットメッセージに issue 番号とタイトルを入れる。

## issue を磨く

`Polished: YYYY-MM-DD` があるリポジトリでは、磨いた最終日を更新する。古い `Polished` は最新日で上書きする。

磨くときは以下を確認する。

- 行番号やシンボル名は、実装着手時に再確認できる形で書く。
- 完了条件は検証可能にする。
- テストや CHANGES.md 更新が必要なら本文に含める。
- 仕様的に決めきれないものは、曖昧なまま実装 issue にしない。`pending/` に移すか、判断事項として明示する。
- 複数 issue に分割する場合は、依存関係と着手順序を本文に書く。

## issue を実装する

- issue の `Branch` が指定されていれば、ユーザー指示またはリポジトリ固有の規約と矛盾しないか確認してから使う。ブランチ操作は `$sasakiy-git` を使う。
- 1 issue 完了ごとに 1 コミットを原則にする。
- 実装中に別の問題が見つかったら、必要に応じて別 issue として起票する。
- issue 本文の完了条件を満たしたことを確認してから close する。

## issue を close する

1. `Completed: YYYY-MM-DD` を実日付に更新する。
2. `## 解決方法` に、何をどう修正したか、どのテストで確認したか、当初方針との差異を記載する。
3. `git mv` で `issues/closed/` へ移動する。
4. コミットメッセージには issue 番号とタイトル、または close したことが分かる内容を入れる。

## pending にする

外部依存、設計判断、リリース判断などで今すぐ対応できない issue は `issues/pending/` に移す。本文には pending にした理由を明記する。pending は close ではないため、`Completed` は完了扱いにしない。

## reopen する

close 済み issue が実は解決していなかった場合は、`git mv` で `issues/closed/` から `issues/` へ戻す。本文に reopen の理由を追記し、何がどう解決していなかったのかを具体的に書く。
