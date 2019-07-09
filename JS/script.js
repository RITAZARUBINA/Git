function buttonClick(){
    var x1 = parseInt(document.getElementById("x1").value);
    var x2 = parseInt(document.getElementById("x2").value);
    var resultDiv = document.getElementById('result');

    if (Number.isNaN(x1) || Number.isNaN(x2) ){
        alert('Wrong input');
        return;
    }

    resultDiv.append("x1+x2: " + (x1 + x2) );


}


function Clear(){
    document.getElementById('result').innerHTML= "";
}

function getFields(){
    var x1 = parseInt(document.getElementById("x1").value);
    var x2 = parseInt(document.getElementById("x2").value);
    var resultDiv = document.getElementById('result');

    if (Number.isNaN(x1) || Number.isNaN(x2) ){
        alert('Wrong input');
        return;
    }
    return [x1,x2]

}

function check(x, x1) {
    return x >= x1;
}

function PrimaryNums(){
    x= getFields();
    x1 = x[0];
    x2 = x[1];

    sieve = []
    for (var i = 1 ;i <= x2; i++){
        sieve.push(i);
    }

    for (var i = 2; i <= x2; i++){
        if (i < sieve.length){
            for (var j = i; j < sieve.length; j++){
                if ( sieve[j] != i && sieve[j] % i == 0){
                    sieve.splice(j, 1);
                }
            }
        }
        else {
            break;
        }
    }
    result = sieve.filter(s => s >= x1);
    console.log(result);
    var resultDiv = document.getElementById('result');
    resultDiv.append("Primary numbers: " + (result.toString()) );

}