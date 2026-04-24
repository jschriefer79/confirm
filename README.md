# /confirm — Post-Purchase Confirmation Letter Skill for Claude Code

A Claude Code plugin that writes post-purchase **confirmation / welcome emails** for long-form financial direct-response promotions.

When a reader hands over their credit card, they're already second-guessing the decision. A good confirmation letter does 5 jobs in the first 72 hours:

1. **Welcomes** the buyer warmly, editor-first-person.
2. **Resells the Big Idea** — kills buyer's remorse by reaffirming the conviction they just bought into.
3. **Establishes editor credibility** — pulls specific facts (career, track record, media) tied to *this* publication's promise.
4. **Delivers the bonus reports twice** — once near the top, once near the bottom. (The #1 source of customer-service complaints post-purchase is "I can't find my reports.")
5. **Previews what's next** — the "Take Your First Steps Today" ritual.

Output is 1,500–2,500 words, delivered as a formatted `.docx` on the user's Desktop (or a configured folder).

## Install

```
/plugin marketplace add jschriefer79/confirm
/plugin install confirm@confirm
```

After install, the skill is available as `/confirm:confirm`.

## Use

Paste the long-form DR promo into the chat — either as a `.docx` file path, raw text, or a link — and say:

```
/confirm:confirm
```

Claude will:
1. Extract the Big Idea, editor name, publication, bonus reports, and track-record claims from the promo.
2. Pull editor credibility from your Credibility Wiki folder (if configured), then the promo, then web search.
3. Draft the letter following the 5-job structure.
4. Save it as `[Promo Short Name] — Confirm Letter.docx` on your Desktop.

## Configuration (optional environment variables)

The skill works out of the box, but three env vars unlock its full capability:

| Variable | Purpose | Default |
|---|---|---|
| `CONFIRM_WIKI_DIR` | Folder containing per-editor credibility `.docx` wikis. When set, the skill uses these as the **first** source for editor bio facts — the gold standard for accuracy. | unset (skips Tier 1, falls through to promo + web) |
| `CONFIRM_EXAMPLES_DIR` | Folder containing reference confirm letters. When set, the skill reads one before drafting to calibrate voice. | unset |
| `CONFIRM_OUTPUT_DIR` | Where the finished `.docx` is saved. | `~/Desktop` |

Set them in your shell (`~/.zshrc` or `~/.bash_profile`):

```bash
export CONFIRM_WIKI_DIR="$HOME/Dropbox/Credibility Wikis"
export CONFIRM_EXAMPLES_DIR="$HOME/Dropbox/Confirm Letter Examples"
export CONFIRM_OUTPUT_DIR="$HOME/Desktop"
```

### Credibility Wiki format

If you're using `CONFIRM_WIKI_DIR`, each editor should have a top-level `.docx` file named something like:

```
Jane Smith - Credibility Wiki.docx
```

Each wiki should contain sections like Executive Summary, Career History, Books, Material Predictions / Track Record, Media Appearances. The skill reads top-level `.docx` files only and ignores any `[Lastname] Bio Claims` subfolders.

You can build these wikis however you like — the skill only cares about the structure.

## Requirements

- Claude Code (any recent version)
- Python 3 with `python-docx` installed:
  ```
  pip install python-docx
  ```
  The skill uses this to generate the `.docx` output file.

## What it won't do

- Write a confirmation letter without a source promo. If you don't hand one over, it will stop and ask.
- Invent credentials, track-record stats, report titles, URLs, or testimonials. Anything it can't confirm gets a placeholder (`[INSERT LINK]`, `[BILLING DESCRIPTOR]`, etc.).
- Ship the letter as raw markdown in chat. The deliverable is a `.docx` on your Desktop, formatted with Calibri body, bold subheads, italicized publication names, and bolded download links.

## Voice

The letter is written in the voice of the editor signing it — warm, authoritative, first-person, arm-around-the-shoulder. Same editor as the promo, different register. The sale is done; this is the editor sitting you down to say *here's exactly what you just bought, why you were right to buy it, and what happens next.*

Reference lineage: Mel Martin, Gene Schwartz, Parris Lampropoulos, John Carlton — the DR greats who understood that the moment after the sale is where you earn the lifetime-value of the customer.

## License

MIT

## Credits

Built by [Joe Schriefer](https://github.com/jschriefer79).
