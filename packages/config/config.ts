import convict from "convict";

const schema = {
    redis: {
        host: {
            doc: "Host name/IP for service",
            format: String,
            default: "http://localhost",
            env: "REDIS_HOST",
        },
        port: {
            doc: "The port which Redis is listening",
            format: "port",
            default: "32856",
            env: "REDIS_PORT",
        }
    }
}

export const configuration = convict(schema);
