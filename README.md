# blam

**blam** is a weapon damage calculator for borderlands 3 so i can think less, shoot more 🤠

blam knows about things like weapon stats and weapon elements. it can use that information to calculate a weapon's maximum damage per second against a single target. blam has also been written as an api, but tbqh i interact with it exclusively through the rails console for now.

## getting started

1. build the image
    ```zsh
    $ docker compose build
    ```
2. jump into the console
    ```zsh
    $ docker compose run --rm api rails c
    ```
3. enter some weapon data
    ```ruby
    > Weapon.create([
      { name: "rooty tooty", item_score: 1, level_requirement: 1, rarity: "Common", damage_per_projectile: 10, number_of_projectiles: 1, accuracy: 0.67, handling: 0.57, reload_time: 2.5, fire_rate: 6.95, magazine_size: 16 },
      { name: "point n shooty", item_score: 1, level_requirement: 1, rarity: "Common", damage_per_projectile: 20, number_of_projectiles: 1, accuracy: 0.67, handling: 0.57, reload_time: 2.5, fire_rate: 6.95, magazine_size: 16 }
    ])
    ```
4. think less
    ```ruby
    > Weapon.all.sort_by(&:projectile_damage_per_second_including_reload_time).last
    # #<point n shooty>
    ```

## building blam better

* in future, it would be pretty neat if blam knew about things like character abilities that impact weapon stats (e.g. reducing reload time, adding additional elemental damage), enemies with multiple armour types, and probably lots of other things.
* fleshing out the api endpoints and building a proper cli (or even gui!) would make it much easier to use.
* it turns out that borderlands 2 is objectively better in every single way, so it'd be great if blam could support multiple games in the series.
