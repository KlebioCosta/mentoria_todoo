import React, { useEffect, useState } from 'react';
import axios from "axios";
import '../components/Saudacao.css';

const GreetingMessage = () => {
    const [message, setMessage] = useState("")
    const [erro, setErro] = useState(false)
    

    const fetchMessage = async () => {
        try {
            const response = await axios.get("http://localhost:8080/saudacao");
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
        <h1>SAUDAÇÃO</h1>
        {erro ? (
            <p>Erro na busca da mensagem.</p>
        ) : (
            <h3>{message}</h3>
        )}
    </div>
  )
}

export default GreetingMessage