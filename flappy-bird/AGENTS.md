# Agent Instructions

## Project Overview

This is a Defold mobile game project for `flappy-bird`. The project currently starts from Defold's mobile template:

- `game.project` contains project, display, input, platform, script, physics, and HTML5 settings.
- `main/main.collection` is the bootstrap collection configured by `game.project`.
- `main/main.script` currently acquires input focus and handles the `touch` action.
- `input/game.input_binding` maps mouse/touch input to `touch`.
- `assets/` contains app icons, `Assets.car`, and template art.

## Working Conventions

- Keep Defold resource paths absolute from the project root, such as `/main/main.collection` or `/assets/background.png`.
- Prefer small, focused gameplay scripts and game object components over large monolithic scripts.
- Preserve Defold-generated text formats unless a change is required. Be careful when editing `.collection`, `.atlas`, `.go`, `.gui`, and similar files because they are serialized project assets.
- Keep mobile portrait assumptions in mind. The current display size is `640x1136`, projection is fixed fit, orientation is vertical, and the touch action is the primary input.
- When adding gameplay, keep world units, physics scale, and camera/display settings consistent with `game.project`.
- Do not remove template assets or app icons unless the task specifically asks for cleanup or replacement.

## Code Style

- Use idiomatic Lua for Defold scripts.
- Keep state local to the script instance through `self` when it belongs to one game object.
- Cache hashes that are used frequently, for example `local TOUCH = hash("touch")`.
- Prefer explicit message names and action names that match the resource or gameplay concept.
- Add comments only for non-obvious behavior, timing, physics tuning, or Defold-specific constraints.

## Validation

After changes, validate at the narrowest useful level:

- For script-only changes, inspect the touched Lua files for syntax and lifecycle correctness.
- For resource or project-setting changes, open/build the project in Defold when available.
- If a command-line Defold or Bob build is configured in the environment, use it to build the project before finishing.
- Manually verify touch/click input when changing input bindings, player movement, scoring, menus, or game restart flow.

## Git And File Hygiene

- Do not revert user changes unless explicitly asked.
- Keep edits scoped to the requested behavior.
- Avoid committing generated build outputs, temporary files, and editor caches.
- Update this file when project-specific workflows, test commands, or architectural conventions become clearer.
