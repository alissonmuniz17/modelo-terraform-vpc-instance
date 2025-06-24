from locust import task, FastHttpUser

class MyUser(FastHttpUser):
    @task
    def index(self):
        self.client.get("/")
