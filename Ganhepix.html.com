<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GanhePix</title>
<style>
*{box-sizing:border-box}
body{
 margin:0;
 background:#101010;
 color:white;
 font-family:Arial,sans-serif;
}
header{
 background:#181818;
 padding:22px;
 text-align:center;
 border-bottom:2px solid #e5b52b;
}
.logo{font-size:30px;font-weight:bold;color:#f4c542}
.logo span{color:white}
main{padding:18px;max-width:500px;margin:auto}
.card{
 background:#202020;
 border:1px solid #383838;
 border-radius:15px;
 padding:20px;
 margin-bottom:18px;
}
.saldo{text-align:center}
.saldo h2{color:#f4c542}
.valor{font-size:34px;font-weight:bold}
button{
 background:#e9b92e;
 color:#171717;
 border:0;
 padding:14px;
 width:100%;
 border-radius:10px;
 font-weight:bold;
 font-size:16px;
 margin-top:10px;
}
.video{
 background:#292929;
 border-radius:12px;
 padding:15px;
 margin:12px 0;
}
.video h3{margin-top:0}
.tag{color:#f4c542}
nav{
 display:flex;
 justify-content:space-around;
 background:#202020;
 padding:15px 5px;
 position:sticky;
 bottom:0;
}
nav button{
 width:auto;
 padding:10px;
 margin:0 3px;
 font-size:12px;
}
section{display:none}
section.active{display:block}
input{
 width:100%;
 padding:13px;
 border-radius:8px;
 border:0;
 margin:8px 0;
}
</style>
</head>
<body>

<header>
 <div class="logo">Ganhe<span>Pix</span></div>
 <small>Sua plataforma de recompensas</small>
</header>

<main>

<section id="inicio" class="active">
 <div class="card saldo">
  <h2>MEU SALDO</h2>
  <div class="valor" id="saldo">0</div>
  <p>Pontos disponíveis</p>
  <button onclick="mostrar('videos')">GANHAR PONTOS</button>
 </div>

 <div class="card">
  <h3>Bem-vindo ao GanhePix!</h3>
  <p>Assista aos conteúdos disponíveis e acompanhe seus pontos.</p>
 </div>
</section>

<section id="videos">
 <div class="card">
  <h2>Vídeos e anúncios</h2>
  <p>Área demonstrativa. Os anúncios reais serão integrados posteriormente.</p>
  <div class="video">
   <h3>Vídeo demonstrativo 01</h3>
   <p class="tag">Recompensa de teste: 10 pontos</p>
   <button onclick="ganhar()">TESTAR RECOMPENSA</button>
  </div>
 </div>
</section>

<section id="carteira">
 <div class="card">
  <h2>Minha carteira</h2>
  <div class="valor"><span id="saldo2">0</span> pontos</div>
  <p>Esta carteira é demonstrativa. Não realiza saques reais.</p>
 </div>
</section>

<section id="perfil">
 <div class="card">
  <h2>Meu perfil</h2>
  <input id="nome" placeholder="Seu nome">
  <input id="email" placeholder="Seu e-mail">
  <button onclick="salvar()">SALVAR PERFIL</button>
  <p id="mensagem"></p>
 </div>
</section>

</main>

<nav>
 <button onclick="mostrar('inicio')">Início</button>
 <button onclick="mostrar('videos')">Vídeos</button>
 <button onclick="mostrar('carteira')">Carteira</button>
 <button onclick="mostrar('perfil')">Perfil</button>
</nav>

<script>
let pontos=0;

function mostrar(id){
 document.querySelectorAll('main section').forEach(s=>{
  s.classList.remove('active');
 });
 document.getElementById(id).classList.add('active');
}

function atualizar(){
 document.getElementById('saldo').textContent=pontos;
 document.getElementById('saldo2').textContent=pontos;
}

function ganhar(){
 pontos+=10;
 atualizar();
 alert('Teste concluído! Você recebeu 10 pontos demonstrativos.');
}

function salvar(){
 let nome=document.getElementById('nome').value;
 document.getElementById('mensagem').textContent=
 nome ? 'Perfil preenchido com sucesso!' : 'Digite seu nome.';
}
</script>

</body>
</html>
