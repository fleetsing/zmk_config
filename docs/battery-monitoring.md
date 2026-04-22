# Battery Monitoring Apps

This repo is currently configured to support external macOS battery-monitoring apps that read ZMK split keyboard battery state over BLE.
ZMK itself does not define a standard host UX for showing both halves, so a dedicated app is still the practical way to monitor central and peripheral battery levels separately.

## Verified app option

- App: [`itouuuuuuuuu/zmk-battery-bar`](https://github.com/itouuuuuuuuu/zmk-battery-bar)
- Verified against the upstream README on 2026-04-22
- Platform requirement in the upstream README: macOS 14 (Sonoma) or later
- Install:

```bash
brew install --cask itouuuuuuuuu/tap/zmk-battery-bar
```

- The upstream app currently shows central (`C`) and peripheral (`P`) battery levels in the macOS menu bar and lets you relabel them as `L` and `R` per keyboard.

## Current Totem setup

- The current Totem configuration treats the left half as the central side.
- To expose the peripheral battery level to apps such as ZMK Battery Bar, the central-side config enables:

```conf
CONFIG_ZMK_BATTERY_REPORTING=y
CONFIG_ZMK_SPLIT_BLE_CENTRAL_BATTERY_LEVEL_PROXY=y
CONFIG_ZMK_SPLIT_BLE_CENTRAL_BATTERY_LEVEL_FETCHING=y
```

- Those settings currently live in `config/totem_left.conf`.
- The current repo does not disable the BLE Battery Service, so apps that read standard BAS characteristics can use it directly.
- If the central side changes in the future, move these settings to the new central side's `.conf` file.

## Using ZMK Battery Bar

1. Launch the app from macOS.
2. If no keyboard is connected yet, use `Add Keyboard...` in the app popover.
3. Select the Totem from the discovered BLE devices list.
4. The app should show central (`C`) and peripheral (`P`) battery levels once connected.
5. If preferred, use the app's built-in label override to display `L` and `R` instead of `C` and `P`.

## Troubleshooting

- If only one battery appears, confirm the keyboard is connected over BLE rather than USB and that the three split battery settings above are present in `config/totem_left.conf`.
- If the app cannot see the keyboard, check macOS Bluetooth permissions for the app.
- If the central side ever changes, the battery proxy settings must move with it.

## Notes

- This integration is intended as a host-side status view only; it does not change keyboard behavior.
- The current settings are aimed at BLE battery reporting for split status apps. They are a useful reference point for future host-side tooling as well.
