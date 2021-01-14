unit main_config_dmvcframework;

interface

uses
  Winapi.Windows,
  IdHTTPWebBrokerBridge,
  Web.WebReq,

  main_config_dmvcframework.webmodule;

procedure RunServer(APort: Integer);

implementation

uses
  System.SysUtils;

procedure RunServer(APort: Integer);
var
  LServer: TIdHTTPWebBrokerBridge;
  FRunning: Boolean;
  LEvent: DWord;
  LHandle: THandle;
  LInputRecord: TInputRecord;
begin

  IsMultiThread := True;
  try

    if WebRequestHandler <> nil then
      WebRequestHandler.WebModuleClass := WebModuleClass;

    WebRequestHandlerProc.MaxConnections := 1000;

      FRunning := true;
      LServer := TIdHTTPWebBrokerBridge.Create(nil);
      try
          LServer.DefaultPort    := APort;
          LServer.Active         := True;
          LServer.MaxConnections := 0;
          LServer.ListenQueue    := 200;

          LHandle := GetStdHandle(STD_INPUT_HANDLE);
          while True do
          begin
             Win32Check(ReadConsoleInput(LHandle, LInputRecord, 1, LEvent));
            if (LInputRecord.EventType = KEY_EVENT) and
              LInputRecord.Event.KeyEvent.bKeyDown and
              (LInputRecord.Event.KeyEvent.wVirtualKeyCode = VK_ESCAPE) then
              break;
          end;

      finally
        LServer.Free;
      end;
  except
    on E: Exception do
    begin
      Raise Exception.Create(E.ClassName + ': ' +#13+ E.Message);
    end;
  end;

end;

end.
