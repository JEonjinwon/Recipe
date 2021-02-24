const cards = document.querySelectorAll('.game-card');

let hasFlippedCard = false;
let lockBoard = false;
let firstCard, secondCard;

function flipCard(){
    if(lockBoard) return;
    if(this === firstCard) return;

    this.classList.toggle('flip');

	if(!hasFlippedCard){
	    hasFlippedCard=true;
	    firstCard=this;
	} else{
	    secondCard=this;
	    checkMatch();
	}
}

function checkMatch(){
    if(firstCard.dataset.image===secondCard.dataset.image){
        disableCards();
    }else{
        unflipCards();
    }
}

function disableCards(){
    firstCard.removeEventListener('click', flipCard);
    secondCard.removeEventListener('click', flipCard);
    resetBoard();
    
}

function unflipCards(){
    lockBoard = true;
    setTimeout(()=>{
    	firstCard.classList.remove('flip');
	    secondCard.classList.remove('flip');
	    resetBoard();
    },1000);

}

function resetBoard(){
    [hasFlippedCard, lockBoard]=[false, false];
    [firstCard, secondCard]=[null, null];
    
    if($(".flip").length == 12) finish();
}

function finish() {
	/*$.ajax({
		url : "/EzCooQ/gameServlet",
		type : "POST",
		data : {"memId" : memId, "point" : point},
		dataType : "json",
		success : function(data) {
			alert('GAME CLEAR');
			location.reload();
		},
		error : function(xhr) {
			console.log(xhr);
			alert("에러발생");
		}
	});*/
	var a = $("#gameMemId").val();
	alert("게임 성공 +100P");
	$("#gameForm").submit();
	
}

(function shuffleCards(){
    cards.forEach(card =>{
        let randomNum=Math.floor(Math.random()*12);
        card.style.order = randomNum;
    });
})();


cards.forEach(card => card.addEventListener('click', flipCard));