# Confirm Letter Tool for Claude Code

A slash command for [Claude Code](https://claude.com/claude-code) that writes the long-form post-purchase confirmation / welcome email that lands in a new subscriber's inbox seconds after they buy a financial direct-response subscription.

Feed it the sales letter the reader bought from. Get back a formatted Word document, signed by the editor — ready to drop into your email platform.

---

## What It Does

When you type `/confirm` in Claude Code and provide a promotion, the tool will:

1. **Read the entire promotion** (Word doc, PDF, URL, or pasted text) and extract the Big Idea, editor name, publication, bonus-report list (verbatim titles), and any specific track-record claims.
2. **Pull editor credibility** in three tiers:
   - **Tier 1** — the shared AIVault Guru Wikis Dropbox folder (`~/Dropbox/AIVault/Guru Wikis/`) if you have access to it
   - **Tier 2** — the "Why Trust Me?" section of the promo itself
   - **Tier 3** — live web search
3. **Draft a 1,500–2,500 word confirmation letter** that does five jobs in order:
   - Welcomes the new buyer warmly (editor first-person, first-name greeting)
   - Resells the Big Idea to kill buyer's remorse
   - Establishes editor credibility with real, specific facts
   - Delivers the bonus-report links **twice** — once near the top, once near the bottom
   - Previews what the subscriber should do in the next 72 hours
4. **Save it as a formatted .docx** on your Desktop (e.g., `The Quickening — Confirm Letter.docx`):
   - Calibri 11pt body, bold subheads
   - Publication names italicized throughout
   - Bonus-report download links bolded between arrow brackets (`» Download "..." — [INSERT LINK] «`)
   - Track-record wins as a bulleted list with ticker/gain bolded
   - Required past-performance disclaimer included

You fill in the placeholders (`[READER NAME HERE]`, `[INSERT LINK]`, `[BILLING DESCRIPTOR]`, `[support@pub.com]`) and the letter is ready to send.

---

## Requirements

- **Claude Code** installed and working ([get it here](https://claude.com/claude-code))
- **Python 3** with the `python-docx` package (the installer handles this)
- **(Optional)** The shared Agora AIVault Dropbox folder synced to your Mac, for the Tier 1 credibility lookup. If you don't have access, /confirm still works — it falls through to Tier 2 and Tier 3.

---

## Installation

### Step 1: Clone this repo

```bash
git clone https://github.com/jschriefer79/confirm.git
cd confirm
```

Or download as a ZIP and unzip it.

### Step 2: Run the installer

```bash
./install.sh
```

The installer:
- Copies `confirm.md` to `~/.claude/commands/confirm.md` (the global Claude Code commands directory, so `/confirm` works in any project)
- Installs `python-docx` if you don't already have it
- Detects whether the AIVault Dropbox folder is present and tells you so

That's it. Open Claude Code, type `/confirm`, and you're in.

---

## How to Use

1. Open Claude Code in any project
2. Type `/confirm`
3. Provide the sales letter the reader bought from (Word doc path, PDF path, URL, or pasted text)
4. Wait 60–90 seconds while Claude pulls credibility, drafts the letter, and builds the Word doc
5. Find your confirmation letter on your Desktop as a `.docx` named after the promo

Before sending, swap the placeholders:
- `[READER NAME HERE]` → subscriber's first name
- `[INSERT LINK]` → real bonus-report URLs
- `[BILLING DESCRIPTOR]` → what appears on the credit-card statement
- `[support@pub.com]` → customer-service address

---

## How to Update

When a new version is released:

```bash
cd confirm
./update.sh
```

The updater pulls the latest version from GitHub and reinstalls.

---

## How to Uninstall

```bash
cd confirm
./uninstall.sh
```

---

## A note on the Dropbox Guru Wiki tier

The Tier 1 credibility source is the shared Agora AIVault Dropbox folder, specifically `~/Dropbox/AIVault/Guru Wikis/`. That folder contains pre-vetted, legally-flagged credibility wikis (track records, books, media appearances) for every editor in the Agora stable. When it's present on your Mac, `/confirm` uses it automatically — no configuration needed.

If you have the AIVault folder but `/confirm` still seems to be missing the wikis, the most common cause is Dropbox's "cloud-only" sync mode — files appear in the folder but aren't actually downloaded to your hard drive until opened. Right-click the AIVault folder in Finder → "Make Available Offline" to force a full sync.

If you don't have AIVault access, `/confirm` falls back to reading editor credibility from the promo itself plus web search. To request access, email Joe at jschriefer@gmail.com.

---

## License

MIT

## Credits

Built by [Joe Schriefer](https://github.com/jschriefer79).
