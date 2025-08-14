# N1Hub.com — n1hub.theme (AI-native FSE WordPress Theme)

**Objective (single source of truth):**  
Ship a **lean, AI-native Full Site Editing (FSE)** WordPress theme for **N1Hub.com** as an **uploadable ZIP**.  
**Scope:** theme-only (no builders, no heavy plugins, no bloat).  
**Targets:** WordPress **≥ 6.6**, PHP **≥ 8.3**.  
**Versioning:** SemVer; increment **+0.01 per iteration** (e.g., `v0.1.0` → `v0.11.0`).  
**Brand palette (dark-first):** bg `#000000`, text `#f3f5f7`, accent `#22d3ee`.

---

## Agent Contract (machine-readable TL;DR)

```json
{
  "project": "n1hub.theme",
  "goal": "Produce an uploadable ZIP of a lean FSE WordPress theme for N1Hub.com.",
  "scope": {
    "allowed": ["n1hub-theme/**", "README.md", ".gitignore"],
    "touchpoints": ["theme.json", "style.css", "functions.php", "templates/**", "parts/**", "patterns/**", "screenshot.png", "readme.txt"],
    "forbidden": ["add page builders", "add heavy sliders", "register random plugins", "introduce large JS/CSS deps", "remote tracking scripts"]
  },
  "targets": { "wordpress": ">=6.6", "php": ">=8.3" },
  "versioning": { "scheme": "semver", "rule": "+0.01 per iteration" },
  "performance": { "ttfb_ms": 600, "lcp_s": 2.5, "max_3p_js_kb": 0 },
  "brand": { "palette": { "bg": "#000000", "text": "#f3f5f7", "accent": "#22d3ee" } },
  "release": { "zip_folder": "n1hub-theme", "zip_name": "n1hub.theme.v{version}.zip" },
  "done_when": [
    "ZIP installs & activates on WP >=6.6 / PHP >=8.3",
    "Homepage renders with no PHP notices/warnings",
    "Pattern 'n1hub/hero' exists",
    "No builders/bloat, guardrails respected"
  ]
}
````

**Human phrase:** *Human-first UX, machine-first structure. Agents must follow this contract strictly.*

---

## Non-Goals / Guardrails

* ❌ No Elementor/Kadence/Divi/etc. builders; no heavy sliders; no external UI kits.
* ❌ No third-party tracking or remote scripts; keep JS to the bare minimum.
* ❌ No plugin development in this repo (theme **only**).
* ✅ Keep diffs small, reversible, and explain the intent in commit messages.
* ✅ Prefer **`theme.json` + templates/parts/patterns** over custom PHP.

---

## Repository Layout

```
/
├─ n1hub-theme/
│  ├─ style.css          # Theme header + minimal CSS tokens (dark-first)
│  ├─ theme.json         # Colors, typography, layout, settings (FSE)
│  ├─ functions.php      # Minimal supports; no business logic
│  ├─ templates/
│  │  └─ index.html      # Base listing page (editable in Site Editor)
│  ├─ parts/
│  │  ├─ header.html
│  │  └─ footer.html
│  ├─ patterns/
│  │  └─ hero.php        # Pattern slug: n1hub/hero
│  ├─ screenshot.png     # 1200×900 preview
│  └─ readme.txt         # Theme-level notes (WP format)
├─ .gitignore
└─ README.md
```

---

## Build & Package

**Windows (PowerShell)**

```powershell
Compress-Archive -Path n1hub-theme -DestinationPath n1hub.theme.v0.1.0.zip -Force
```

**macOS/Linux**

```bash
zip -r n1hub.theme.v0.1.0.zip n1hub-theme
```

**Install ZIP:**
WP Admin → **Appearance → Themes → Add New → Upload Theme** → select ZIP → Install → Activate.

---

## Performance & Accessibility Budgets

* **TTFB < 600 ms** (server/hosting dependent; keep theme thin).
* **LCP < 2.5 s** on a default page (no heavy assets).
* **3rd-party JS:** **0 KB** (avoid external deps).
* **CSS/JS size:** keep minimal; leverage block styles and `theme.json`.
* Aim **contrast-safe** colors and semantic markup in templates.

---

## Defaults & Tokens

* **Palette:** `#000000` (bg) / `#f3f5f7` (text) / `#22d3ee` (accent).
* **Fonts:** System UI stack; optional Mono for code (JetBrains Mono if available).
* **Header:** sticky, minimal; **Nav:** standard `core/navigation`.
* **Pattern:** `n1hub/hero` with two CTAs (“About”, “Blog”).

---

## Agent Workflow (Do This)

1. **Plan** — Identify the smallest valuable change aligned with this contract.
2. **Modify** — Touch only allowed files; prefer `theme.json`/templates/parts/patterns.
3. **Validate** — Theme lints; **activates on WP ≥ 6.6 / PHP ≥ 8.3**; no notices/warnings.
4. **Check budgets** — No builders/bloat; guardrails respected.
5. **Package** — Produce `n1hub.theme.vX.Y.Z.zip` from `/n1hub-theme`.
6. **Document** — Commit message explains what/why; update README if a rule changes.

---

## Definition of Done (Check all)

* [ ] ZIP builds: `n1hub.theme.vX.Y.Z.zip`.
* [ ] Installs & **activates** on **WP ≥ 6.6 / PHP ≥ 8.3**.
* [ ] Homepage renders with **no PHP warnings/notices**.
* [ ] **Pattern** `n1hub/hero` visible in Patterns.
* [ ] **No builders/bloat**; performance guardrails intact.
* [ ] Brand tokens (dark-first palette) preserved.
* [ ] Changes are **minimal and reversible**; commit message explains intent.

---

## Roadmap (initial)

* Additional patterns: Home/CTA/Blog.
* Template variants: page, single, archive.
* Optional light-mode tokens via `theme.json`.
* CI workflow to auto-zip on tag `v*.*.*`.

---

## FAQ (for agents)

**Q:** Can I add a plugin or JS framework to speed up development?
**A:** No. This theme must remain lean and portable. Use core blocks and `theme.json`.

**Q:** Where do I add custom logic?
**A:** Avoid PHP logic; favor block patterns and templates. If absolutely needed, keep `functions.php` minimal and documented.

**Q:** What if I need new colors/typography?
**A:** Edit `theme.json` tokens; do not hardcode styles in templates.

**Q:** How do I increase version?
**A:** SemVer; **+0.01 per iteration**. Update ZIP name accordingly.

---

## License

GPL-2.0-or-later (compatible with WordPress theme guidelines).

```
```
