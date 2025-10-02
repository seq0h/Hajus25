import crypto from 'crypto';

// In-memory storage
export const store = {
    users: new Map(),
    messages: [],
};

export const userService = {
    createUser: async (username, hashedPassword) => {
        console.log('Data layer: Creating user:', { username });

        if (store.users.has(username)) {
            throw new Error('Username already exists');
        }

        store.users.set(username, { username, password: hashedPassword });
        return { username };
    },

    getUser: async (username) => {
        if (store.users.has(username)) {
            return store.users.get(username);
        }
        return undefined;
    },
};

export const messageService = {
    addMessage: async (username, content) => {
        const message = {
            id: crypto.randomUUID(),
            username,
            content
        };

        store.messages.push(message);
        return message;
    },

    getMessages: async () => {
        return store.messages;
    },

    deleteMessage: async (messageId) => {
        const index = store.messages.findIndex(msg => msg.id === messageId);
        if (index !== -1) {
            store.messages.splice(index, 1);
            return true;
        }
        return false;
    }
};
