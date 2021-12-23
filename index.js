// Connecting modules
const Telegraf = require('telegraf');
// const HttpsProxyAgent = require('https-proxy-agent');
// General settings
let config = {
    "token": "YOUR_TOKEN", // Bot token
    "admin": admin-id-here // bot owner id
};
// Creating a bot object
const bot = new Telegraf(config.token, {
        // If you need to go through a proxy, specify it: user, pass, host, port
        // telegram: { agent: new HttpsProxyAgent('http://user:pass@host:port') }
    }
);
// Text Settings
let replyText = {
    "helloAdmin": "Great, you have successfully installed a feedback bot. Now share your bot and wait for messages.",
    "helloUser":  "Greetings, send me a message. I will try to answer as soon as possible.",
    "replyWrong": "Use the Reply function to reply to the user."
};
// Checking the user's rights
let isAdmin = (userId) => {
    return userId == config.admin;
};
// We redirect the admin from the user or notify the admin about the error
let forwardToAdmin = (ctx) => {
    if (isAdmin(ctx.message.from.id)) {
        ctx.reply(replyText.replyWrong);
    } else {
        ctx.forwardMessage(config.admin, ctx.from.id, ctx.message.id);
    }
};
// Bot Start
bot.start((ctx) => {
    ctx.reply(isAdmin(ctx.message.from.id)
        ? replyText.helloAdmin
        : replyText.helloUser);
});
// Listening for the presence of the message object
bot.on('message', (ctx) => {
    // make sure it was the admin who responded to the user's message
    if (ctx.message.reply_to_message
        && ctx.message.reply_to_message.forward_from
        && isAdmin(ctx.message.from.id)) {
        // we send a copy to the user
        ctx.telegram.sendCopy(ctx.message.reply_to_message.forward_from.id, ctx.message);
    } else {
        // redirecting to the admin
        forwardToAdmin(ctx);
    }
});
// bot launch
bot.launch();
