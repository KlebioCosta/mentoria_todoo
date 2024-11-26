import React, { useEffect, useState } from 'react';
import api from "../api/axios";
import './Saudacao.css';

const GreetingMessage = () => {
    const [message, setMessage] = useState("")
    const [erro, setErro] = useState(false)
    

    const fetchMessage = async () => {
        try {
            const response = await api.get("/saudacao");
            setMessage(response.data);
        } catch (error) {
            console.error("Erro na busca da mensagem:", error);
            setErro(true);
        }
    };

    useEffect(() => {
        fetchMessage();
    }, []);


  return (
    <div className='saudacao-container'>
        <h1>TODO APP</h1>
        {erro ? (
            <p>Erro na busca da mensagem.</p>
        ) : (
            <h3>{message}</h3>
        )}
    </div>
  )
}

export default GreetingMessage