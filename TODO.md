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

- <mark>_On 18/6_</mark>, open the Nether by updating the following file:
  - In `server.properties`, set `allow-nether=true`.

## 30/6: NAF - Base rating

- Organize and announce the base rating event.

## 12/7: NAF - Open The End for the first time

- <mark>_On 11/7_</mark>, open The End by updating the following file:
  - In `bukkit.yml`, set `allow-end: true`.
- After the first dragon is defeated, use this command to disable The End:
  ```
  allowend false
  nlogin restart
  ```
- On 12/7, close The End by updating the following file:
  - In `bukkit.yml`, set `allow-end: false`.

## 19/7: NAF - New boss

- Introduce a new boss to the server.

## 31/7: NAF - Base rating

- Organize and announce the base rating event.

## 2/8: Open The End

- <mark>_On 1/8_</mark>, open The End by updating the following file:
  - In `bukkit.yml`, set `allow-end: true`.

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

## 7/9: NAF - Hardcore event

- <mark>_On 6/7_</mark>, change the difficulty to hardcore:
  - In `server.properties`, set `hardcore=true`.
