module challenge::hero;

use std::string::String;

// ========= STRUCTS =========
public struct Hero has key, store {
    id: UID,
    name: String,
    image_url: String,
    power: u64,
}

public struct HeroMetadata has key, store {
    id: UID,
    timestamp: u64,
}

// ========= FUNCTIONS =========

#[allow(lint(self_transfer))]
public fun create_hero(name: String, image_url: String, power: u64, ctx: &mut TxContext) {
    
    // TODO: Create a new Hero struct with the given parameters
     let hero = Hero {
            id: object::new(ctx),
            name:name,
            image_url,
            power,
  };
        // Hints:
        // Use object::new(ctx) to create a unique ID
        // Set name, image_url, and power fields
    // TODO: Transfer the hero to the transaction sender
    transfer::public_transfer(hero,tx_context::sender(ctx));
    // TODO: Create HeroMetadata and freeze it for tracking
    let metadata = HeroMetadata {
        id: object::new(ctx),
        timestamp:ctx.epoch_timestamp_ms(),
    };
        // Hints:
        // Use ctx.epoch_timestamp_ms() for timestamp
    //TODO: Use transfer::freeze_object() to make metadata immutable
    transfer::freeze_object(metadata);
}

// ========= GETTER FUNCTIONS =========

public fun hero_power(hero: &Hero): u64 {
    hero.power
}

#[test_only]
public fun hero_name(hero: &Hero): String {
    hero.name
}

#[test_only]
public fun hero_image_url(hero: &Hero): String {
    hero.image_url
}

#[test_only]
public fun hero_id(hero: &Hero): ID {
    object::id(hero)
}

