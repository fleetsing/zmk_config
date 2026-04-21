# Battery Monitoring Apps

This repo is currently configured to support external macOS battery-monitoring apps that read ZMK split keyboard battery state over BLE.

## Current app

- App: [`itouuuuuuuuu/zmk-battery-bar`](https://github.com/itouuuuuuuuu/zmk-battery-bar)
- Platform: macOS 14 or later
- Install:

```bash
brew install --cask itouuuuuuuuu/tap/zmk-battery-bar
```

## Current Totem setup

- The current Totem configuration treats the left half as the central side.
- To expose the peripheral battery level to apps such as ZMK Battery Bar, the central-side config now enables:

```conf
CONFIG_ZMK_BATTERY_REPORTING=y
CONFIG_ZMK_SPLIT_BLE_CENTRAL_BATTERY_LEVEL_PROXY=y
CONFIG_ZMK_SPLIT_BLE_CENTRAL_BATTERY_LEVEL_FETCHING=y
```

- Those settings currently live in `config/totem_left.conf`.
- If the central side changes in the future, move these settings to the new central side's `.conf` file.

## Using ZMK Battery Bar

1. Launch the app from macOS.
2. If no keyboard is connected yet, use `Add Keyboard...` in the app popover.
3. Select the Totem from the discovered BLE devices list.
4. The app should show central (`C`) and peripheral (`P`) battery levels once connected.
5. If preferred, use the app's built-in label override to display `L` and `R` instead of `C` and `P`.

## Notes

- This integration is intended as a host-side status view only; it does not change keyboard behavior.
- The current settings are aimed at BLE battery reporting for split status apps. They are a useful reference point for future host-side tooling as well.
