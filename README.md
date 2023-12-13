# ESX Health and Armor Save System

This ESX script for FiveM servers adds functionality to save and restore players' health and armor levels when they log out and back in. It ensures a seamless and persistent gameplay experience. It also works with Multicharacter relog features

## Features

- **Health and Armor Saving**: Automatically saves a player's health and armor levels upon logging out or disconnecting.
- **Restoration on Login**: Restores saved health and armor levels when a player logs back into the server.
- **Database Integration**: Stores health and armor data in the `users` table of the server's database.

## Installation

1. **Clone the Repository**: 
git clone https://github.com/peppestan/health-armor-save-system.git

3. **Modify Your Database**:
- Add `health` and `armor` columns to your `users` table in the database.
- health values should be INT, default: 200 (or as needed)
- Armor values should be INT, default: 0 (or as needed)

3. **Install the Script**:
- Copy the `health-armor-save-system` folder into your server's `resources` directory.
- Add `ensure health-armor-save-system` to your server.cfg.

## Usage

- The script works automatically. It triggers on player logouts and logins.
- Health and armor data are saved in the `users` table, keyed by the player's identifier.

## Configuration

- No additional configuration is required.

## Dependencies

- ESX

## Contributing

Contributions to the project are welcome. Please fork the repository and submit a pull request with your changes.

## License

[MIT License](LICENSE)

## Acknowledgements

- Thanks to the FiveM and ESX communities for their support and guidance.

