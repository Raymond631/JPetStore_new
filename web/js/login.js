function newVerification() {
    let image = document.getElementById("verificationCode");
    image.src = "../User/verificationCode?" + new Date().getMilliseconds();
    console.log("1234")
}
