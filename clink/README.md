# Portable Clink Profile

This profile is designed to be copied between Windows machines.

## Location

- Primary profile: `%USERPROFILE%\\.config\\clink`

## Files

- `clink_settings`: Clink settings (`clink set` values).
- `.inputrc`: Readline keybindings and completion behavior.
- `clink_start.cmd`: Main startup aliases/macros (doskey, env vars).
- `appstart.cmd`: Startup orchestrator with priority order.
- `user_init.lua`: Main Lua entrypoint for prompt/completion customizations.
- `bootstrap_clink_portable.cmd`: One-time setup script for a new machine.

Optional home-level fallbacks:
- `%USERPROFILE%\\clink_start.cmd`
- `%USERPROFILE%\\.inputrc`
- `%USERPROFILE%\\clink_home.lua`

## Startup Order

`appstart.cmd` calls startup scripts in this order:

1. `%USERPROFILE%\\.config\\clink\\clink_start.cmd`
2. `%USERPROFILE%\\clink_start.cmd`
3. `%=clink.bin%\\clink_start.cmd`

Lua script search order is set by `clink.path`:

1. `%USERPROFILE%\\.config\\clink`
2. `%USERPROFILE%`
3. `%=clink.bin%`

## Move To Another Machine

1. Install Clink (e.g. Scoop).
2. Copy this folder to `%USERPROFILE%\\.config\\clink`.
3. Run:

```cmd
%USERPROFILE%\.config\clink\bootstrap_clink_portable.cmd
```

4. Open a new CMD window.

## Useful Commands

```cmd
clink info
clink autorun show
clink set *
clink set clink.path
clink set clink.autostart
```

## Current Alias Notes

From `clink_start.cmd`:
- `npm` -> `bun`
- `npx` -> `bunx`
- `realnpm` -> `npm.cmd` (bypass)

## Editing Tips

- Keep machine-specific paths out of config files.
- Prefer `%USERPROFILE%` and `%=clink.bin%` for portability.
- Put command aliases in `clink_start.cmd`.
- Put keybindings in `.inputrc`.
- Put advanced behavior in `user_init.lua`.

