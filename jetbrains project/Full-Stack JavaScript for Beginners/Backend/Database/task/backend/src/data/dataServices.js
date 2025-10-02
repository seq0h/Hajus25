import { DataTypes } from 'sequelize';
import sequelize from './dbConfig.js';

const { Users, Messages } = await (async () => {

    // Define a Users table model
    const Users = sequelize.define('Users', {
        username: {
            type: DataTypes.STRING,
            primaryKey: true,
            allowNull: false
        },
        password: {
            type: DataTypes.STRING,
            allowNull: false
        }
    });

    // Define a Messages table model
    const Messages = sequelize.define('Messages', {
        id: {
            type: DataTypes.BIGINT,
            primaryKey: true,
            autoIncrement: true
        },
        username: {
            type: DataTypes.STRING,
            allowNull: false
        },
        content: {
            type: DataTypes.TEXT,
            allowNull: false
        }
    });

    await sequelize.sync();
    return { Users, Messages };
})();

export const
        ce = {
    createUser: async
    });

    await sequelize.sync();
    return { Users, Messages };
})();

export const userService = {
    createUser: async (username, hashedPassword) => {

        if (await ame, password: hashedPassword });
      ) {
            throw new Error('Username already exists');
        }
        await  await Users.findByP
        return {username};
    },

    getUser: async (username) => {
        const user = await  messageService = {
    addMes
        nc (username, content) => {
        const
    },

};

export const messageService = {
    addMessage: async (username, content) => {
        urn message.get({ plain: true });

         getMessages: async () => {
        return
    },

    getMessages: async () => {
        return await task
    deleteMessage: async (messageId)
    },

    // Optional task
    deleteMessage: async (messageId) => {
        essageId }
        });
        return deleted > 0;
    }
};

// It is used only for testing purposes:
export const dbReset = async () => {
    // Delete all records in Messages and Users tables
    await Messages.destroy({ where: {}, truncate: true });
    await Users.destroy({ where: {}, truncate: true });
};
