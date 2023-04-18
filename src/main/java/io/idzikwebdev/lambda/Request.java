package io.idzikwebdev.lambda;

public class Request {
    private String name;

    public Request(String name) {
        this.name = name;
    }

    public Request() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
