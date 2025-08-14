N1Hub Theme (n1hub.theme)

Lean, AI-native Full Site Editing (FSE) WordPress theme for N1Hub.com. Deliverable each iteration: an uploadable ZIP. Scope: theme-only (no builders/bloat). Targets: WordPress ≥ 6.6, PHP ≥ 8.3. Versioning: SemVer (+0.01 per iteration).

## Objective
- Ship an uploadable ZIP of a minimal, clarity-first block theme for N1Hub.com.
- Keep zero external scripts, zero page builders, and minimal code.

## Contract (single source of truth)
- WordPress: ≥ 6.6
- PHP: ≥ 8.3
- Versioning: SemVer; +0.01 per iteration
- Performance budgets: TTFB < 600 ms, LCP < 2.5 s, 3rd-party JS = 0
- Brand palette: bg `#000000`, text `#f3f5f7`, accent `#22d3ee`
- Allowed scope: `n1hub-theme/**`, `README.md`, `.github/**`, `.gitignore`, `ai-contract.json`, `LICENSE`, `.editorconfig`, `.gitattributes`, `CONTRIBUTING.md`, `SECURITY.md`, `CODEOWNERS`

See `ai-contract.json` for the canonical, machine-readable contract.

## Theme structure
- `n1hub-theme/theme.json`: global styles, tokens, and supports
- `n1hub-theme/style.css`: theme header + minimal CSS tokens
- `n1hub-theme/functions.php`: theme supports only; no business logic
- `n1hub-theme/templates/*`: FSE templates (index, etc.)
- `n1hub-theme/parts/*`: header/footer parts
- `n1hub-theme/patterns/*`: block patterns (includes `n1hub/hero`)
- `n1hub-theme/screenshot.png`: 1200×900 preview

## Guardrails
- No page builders (Elementor/Divi/WPBakery/Kadence/etc.)
- No heavy sliders or random plugins
- No external/3rd-party JS, fonts, or analytics
- Prefer core blocks and `theme.json` for design tokens

## Build and release
Continuous Integration validates JSON and PHP, enforces guardrails, and uploads a ZIP artifact on each push. Tagging `vX.Y.Z` triggers a GitHub Release with the final ZIP attached.

Local packaging examples:
- PowerShell: `./scripts/make-zip.ps1 -Version 0.1.0` (or use `Compress-Archive` directly)
- POSIX: `zip -r n1hub.theme.v0.1.0.zip n1hub-theme`

## Contributing
- Small, focused PRs
- Follow `ai-contract.json`
- Prefer `theme.json`, templates/parts/patterns over custom PHP
- Bump SemVer by +0.01 per iteration; tag `vX.Y.Z`

## Security
No secrets in this repo. Report vulnerabilities via GitHub Issues (private if possible).

## License
GPL-2.0-or-later. See `LICENSE`.

## Quickstart (RU)
1) Скачай ZIP релиза `n1hub.theme.vX.Y.Z.zip`.
2) WordPress → Внешний вид → Темы → Добавить → Загрузить тему → выбери ZIP → Установить → Активировать.
3) В редакторе сайта (FSE) отредактируй Шапку/Футер и шаблон Главной.
4) Паттерн: добавь `Home Hero` (slug: `n1hub/hero`) на Главную.


