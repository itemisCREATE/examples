export function validate(value) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      return /^[a-zA-Z]+$/.test(value) ? resolve() : reject();
    }, 1000);
  });
}

export function submit(values) {
  console.log("Submitting", values);
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if(Math.random() < 0.4 || values.one === "error"){
        console.log("rejected"); reject()
      }else{
        console.log("resolved"); resolve();
      }
    }, 1000);
  });
}

var status = null;

function setStatus(){
  if(status === null){
    resetStatus();
  }
}

export function getStatus(){
  setStatus();
  return status;
}

export function getNotStatus(){
  setStatus();
  return !status;
}

export function resetStatus(context){
  status = Math.random() < 0.4
}
