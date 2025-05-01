## A few days before the start of the new season

- Preload your world with Chunky:
  ```
  chunky world world
  chunky radius 10000
  chunky start
  chunky world world_nether
  chunky radius 10000
  chunky start
  chunky world world_the_end
  chunky radius 10000
  chunky start
  ```

## 10/6: Recheck everything

- Verify that all plugins and configurations are working properly.
- Test server performance and resolve any issues.
- Close the Nether and The End by updating the following files:
  - In `server.properties`, set `allow-nether=false`.
  - In `bukkit.yml`, set `allow-end: false`.

## 12/6: NAF - Start new season

- Announce the start of the new season to players.

## 19/6: NAF - Open the Nether

- On 18/6, open the Nether by updating the following file:
  - In `server.properties`, set `allow-nether=true`.

## 30/6: NAF - Base rating

- Organize and announce the base rating event.

## 12/7: NAF - Open The End for the first time

- On 11/7, open The End by updating the following file:
  - In `bukkit.yml`, set `allow-end: true`.
- After the first dragon is defeated, use this command to disable The End:
  ```
  allowend
  ```
- On 12/7, close The End by updating the following file:
  - In `bukkit.yml`, set `allow-end: false`.

## 19/7: NAF - New boss

- Introduce a new boss to the server.

## 31/7: NAF - Base rating

- Organize and announce the base rating event.

## 2/8: Open The End

- On 1/8, open The End by updating the following file:
  - In `bukkit.yml`, set `allow-end: true`.
- On 1/8, remove the script file located at `plugins/Skript/scripts/allowend.sk`.

## 5/8: NAF - PVP

- Organize and announce the PVP event.

## 13/8: NAF - PVP

- Organize and announce the PVP event.

## 16/8: NAF - Difficulty is hard

- Change the server difficulty to hard:
  ```
  difficulty hard
  ```

## 21/8: NAF - PVP

- Organize and announce the PVP event.

## 29/8: NAF - PVP

- Organize and announce the PVP event.

## 31/8: NAF - Base rating

- Organize and announce the base rating event.

## 2/9: NAF - Close the Nether and The End

- Close the Nether and The End by updating the following files:
  - In `server.properties`, set `allow-nether=false`.
  - In `bukkit.yml`, set `allow-end: false`.
- Announce the Border event.

## 3/9: NAF - Border reduced to 9000 block radius

- Run these commands to update the Border:
  ```
  chunky radius 9000
  chunky border add
  worldborder set 18000
  ```

## 4/9: NAF - Border reduced to 8000 block radius

- Run these commands to update the Border:
  ```
  chunky radius 8000
  chunky border add
  worldborder set 16000
  ```

## 5/9: NAF - Border reduced to 7000 block radius

- Run these commands to update the Border:
  ```
  chunky radius 7000
  chunky border add
  worldborder set 14000
  ```

## 6/9: NAF - Border reduced to 6000 block radius

- Run these commands to update the Border:
  ```
  chunky radius 6000
  chunky border add
  worldborder set 12000
  ```

## 7/9: NAF - Border reduced to 5000 block radius

- Run these commands to update the Border:
  ```
  chunky radius 5000
  chunky border add
  worldborder set 10000
  ```
- On 6/7, change the difficulty to hardcore:
  - In `server.properties`, set `hardcore=true`.

## 8/9: NAF - Border reduced to 4000 block radius

- Run these commands to update the Border:
  ```
  chunky radius 4000
  chunky border add
  worldborder set 8000
  ```

## 9/9: NAF - Border reduced to 3000 block radius

- Run these commands to update the Border:
  ```
  chunky radius 3000
  chunky border add
  worldborder set 6000
  ```

## 10/9: NAF - Border reduced to 2000 block radius

- Run these commands to update the Border:
  ```
  chunky radius 2000
  chunky border add
  worldborder set 4000
  ```

## 11/9: NAF - Border reduced to 1000 block radius

- Run these commands to update the Border:
  ```
  chunky radius 1000
  chunky border add
  worldborder set 2000
  ```

## 12/9: NAF - Border reduced to 500 block radius

- Run these commands to update the Border:
  ```
  chunky radius 500
  chunky border add
  worldborder set 1000
  ```
- Gradually reduce the border size by `50 blocks/hour`.
- End the season.
