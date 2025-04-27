from fastapi import FastAPI


app = FastAPI()





@app.get('/')
async def test():
    
    print("log test to check buffering")

    return {"message" : "Testing , Hi i am working 🙏"}

