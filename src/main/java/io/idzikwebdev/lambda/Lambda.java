package io.idzikwebdev.lambda;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;

public class Lambda implements RequestHandler<Request,Response> {
    @Override
    public Response handleRequest(Request request, Context context) {
        String message = String.format("Hey, %s!", request.getName());
        return new Response(message);
    }
}
