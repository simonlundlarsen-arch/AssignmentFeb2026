codeunit 50103 "SLL JsonPlaceholder API Mgt" implements "SLL IAssignmentData"
{
    procedure GetData()
    var
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        ResponseContent: HttpContent;
        ResponseText: Text;

        JArray: JsonArray;
        JObject: JsonObject;
        JToken: JsonToken;

        UserIDvar: Integer;
        Title: Text[100];
        CompletedStatus: Boolean;

        PathLbl: Label 'http://jsonplaceholder.typicode.com/todos', Locked = true;
        RequestErr: Label 'The Request did not complete successfully';
        SuccessMsg: Label 'Connection Done\\ %1';
    begin
        if not Client.Get(PathLbl, ResponseMessage) then
            Error(RequestErr);

        ResponseContent := ResponseMessage.Content;
        ResponseContent.ReadAs(ResponseText);
        if not ResponseMessage.IsSuccessStatusCode then
            Error(RequestErr);
        JArray.ReadFrom(ResponseText);
        foreach JToken in JArray do begin
            JObject := JToken.AsObject();
            if JObject.SelectToken('userId', JToken) then
                UserIDvar := JToken.AsValue().AsInteger()
            else
                UserIDvar := 0;
            if JObject.SelectToken('title', JToken) then begin
                Title := JToken.AsValue().AsText()
            end
            else
                Title := '';
            if JObject.SelectToken('completed', JToken) then
                CompletedStatus := JToken.AsValue().AsBoolean()
            else
                CompletedStatus := false;
            InsertAssignment(UserIDvar, Title, CompletedStatus)
        end;
    end;

    local procedure InsertAssignment(UserId: Integer; Title: Text[100]; CompletedStatus: Boolean)
    var
        AssignmentMgt: Codeunit "SLL Assignment Mgt";
    begin
        if CompletedStatus then
            AssignmentMgt.InsertAssignment(UserId, Title, Enum::"SLL Assignment Status"::Completed)
        else
            AssignmentMgt.InsertAssignment(UserId, Title, Enum::"SLL Assignment Status"::Incomplete)
    end;
}