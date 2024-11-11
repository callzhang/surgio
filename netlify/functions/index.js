'use strict';

const gateway = require('@surgio/gateway');

module.exports.handler = gateway.createLambdaHandler({
    // Required configuration
    config: {
        urlBase: process.env.SURGIO_URL_BASE || 'http://localhost:3000',
        artifacts: [],
        providers: []
    },
    // Optional but recommended
    // auth: {
    //     username: process.env.SURGIO_AUTH_USERNAME,
    //     password: process.env.SURGIO_AUTH_PASSWORD
    // }
});
