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
2. Pull editor credibility from the Guru Wiki Dropbox folder (if you have it — see below), then the promo, then web search.
3. Draft the letter following the 5-job structure.
4. Save it as `[Promo Short Name] — Confirm Letter.docx` on your Desktop.

## Optional Power-Up: The Guru Wiki folder

The skill gets noticeably sharper when it has access to the shared Agora **AIVault** Dropbox folder — specifically `~/Dropbox/AIVault/Guru Wikis/`. That folder contains pre-vetted credibility wikis (track records, book lists, media appearances, legal flags) for the editors who appear most often in Agora promos.

If that folder exists on your Mac, the skill picks it up automatically — no configuration, no env vars, no setup. Just install and go.

If the folder doesn't exist (because you're not part of the Agora network, or you haven't accepted the Dropbox share invite), the skill silently falls through to reading editor credibility straight from the promo you provide it, plus web search. It still works — it's just not *as* sharp.

To get access to the Dropbox folder, email **jschriefer@gmail.com**.

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
