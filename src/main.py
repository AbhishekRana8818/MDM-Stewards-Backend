from fastapi import FastAPI


app = FastAPI()





@app.get('/')
async def test():
    
    print("log test to check buffering")
    print("check the logs of the azure app active dir")

    return {"message" : "Testing  , Hi i am working 🙏"}

