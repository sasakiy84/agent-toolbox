---
name: technical-book-writing
description: Use when drafting, revising, outlining, or reviewing Japanese technical explanations, book chapters, tutorials, design docs, or educational engineering articles so they read like high-quality technical writing with clear reader goals, structure, examples, definitions, tradeoffs, and chapter-level flow.
---

# Technical Book Writing

Use this skill to write or revise Japanese technical explanations as structured educational prose. Optimize for reader understanding, not for listing facts.

## Core Workflow

1. Identify the reader and the expected state after reading.
2. State the central question the text answers.
3. Choose one explanation pattern:
   - **Misconception first**: start from a likely misunderstanding, then correct it.
   - **Map first**: classify the domain before introducing individual terms.
   - **Tradeoff first**: compare options by fixed decision axes.
   - **Definition to implementation**: define terms, model them, then descend into implementation.
   - **Mechanism to operation**: connect protocol, configuration, failure, and operation.
4. Build the section in this order:
   - question
   - definition
   - minimal example
   - mechanism
   - limitation or failure mode
   - practical judgment
   - transition to the next section
5. End chapters by answering the opening question and naming what the reader can now judge.

## Required Writing Moves

- Define important terms at first use.
- Put the reader's likely confusion into words before correcting it.
- Use small examples before production-like examples.
- Explain why the example matters immediately after showing it.
- Include failure cases, limits, or unsafe shortcuts.
- Use comparison tables only after fixing comparison axes.
- Make chapter titles express the understanding gained, not just the technology name.
- Prefer concrete transitions: "ここまでで X を見た。次に Y が問題になる。"

## Style Rules

- Use Japanese by default.
- Choose either `です・ます` or `だ・である` and keep it consistent.
- Use `です・ます` for practical guides, tutorials, and team documentation.
- Use `だ・である` for formal definitions, theory-heavy writing, or specification-like prose.
- Keep most sentences around 40-80 Japanese characters.
- Split long sentences by cause/effect, premise/conclusion, definition/example, or general rule/exception.
- Use connectives deliberately: `つまり`, `一方で`, `ただし`, `なぜなら`, `具体的には`, `ここで重要なのは`.

## Output Checklist

Before finalizing, verify that the text:

- Names the reader and reading goal, explicitly or implicitly.
- Starts from a problem, question, or misconception.
- Defines core terms before relying on them.
- Gives at least one minimal example or concrete case.
- Explains what the example demonstrates.
- Mentions a limitation, failure mode, or tradeoff.
- Avoids treating best practices as unexplained commands.
- Ends with a summary that answers the opening question.

## Detailed Reference

For templates, examples, chapter samples, and revision patterns, read:

- `references/writing-guidelines.md`

Use the reference when the task asks for a full chapter outline, substantial rewrite, writing guideline application, examples of good/bad prose, or a review of an existing technical document.
