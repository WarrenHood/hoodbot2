use serenity::prelude::*;

#[tokio::main]
async fn main() {
    let token = std::env::var("DISCORD_TOKEN").expect("Expected a DISCORD_TOKEN environment variable");

    let intents = GatewayIntents::GUILD_MESSAGES | GatewayIntents::DIRECT_MESSAGES | GatewayIntents::MESSAGE_CONTENT;

    let mut client = Client::builder(token, intents).await.expect("Failed to create client");

    if let Err(err) = client.start().await {
        eprintln!("Error starting client: {err:?}");
    }
}
