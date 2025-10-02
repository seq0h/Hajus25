import { useState, useEffect } from 'react';
import axios from 'axios';

function Chat({ onLogout }) {

    const [messages, setMessages] = useState([]);
    const [newMessage, setNewMessage] = useState('');

    const handleLogout = () => {
        localStorage.removeItem('token');
        onLogout();
    };

    useEffect(() => {
        const fetchMessages = async () => {
            try {
                const token = localStorage.getItem('token');
                const response = await axios.get('/api/messages', {
                    headers: { Authorization: `Bearer ${token}` }
                });
                setMessages(response.data);
            } catch (error) {
                console.error('Failed to fetch messages:', error);
            }
        };

        fetchMessages().then(() => console.log('Successfully fetched messages!'));
    }, []);

    const handleSubmit = async (e) => {
        e.preventDefault();

        // does not allow sending empty messages:
        if (!newMessage.trim()) return;

        try {
            const token = localStorage.getItem('token');
            await axios.post('/api/messages',
                { content: newMessage },
                { headers: { Authorization: `Bearer ${token}` } }
            );

            setNewMessage('');
        } catch (error) {
            console.error('Failed to send message:', error);
        }
    };

    return (
        <div className="chat-container">
            <div className="chat-header">
                <button
                    onClick={handleLogout}
                    className="logout-button"
                >
                    Logout
                </button>
            </div>
            <div className="messages-container">
                {messages.map((message) => (
                    <div key={message.id} className="message">
                        <strong>{message.username}: </strong>
                        <span>{message.content}</span>
                    </div>
                ))}
            </div>
            <form onSubmit={handleSubmit} className="message-form">
                <input
                    type="text"
                    value={newMessage}
                    onChange={(e) => setNewMessage(e.target.value)}
                    placeholder="Type a message..."
                />
                <button type="submit">Send</button>
            </form>
        </div>
    );
}

export default Chat;
