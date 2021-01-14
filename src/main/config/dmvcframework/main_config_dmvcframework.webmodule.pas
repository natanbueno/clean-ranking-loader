unit main_config_dmvcframework.webmodule;

interface

uses
  System.SysUtils,
  System.Classes,

  Web.HTTPApp,

  MVCFramework.Commons,
  MVCFramework.Serializer.JsonDataObjects,
  MVCFramework, main_config_routes;

type
  TWebModuleDMVCFramwork = class(TWebModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
     FMVC: TMVCEngine;
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModuleDMVCFramwork;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TWebModuleDMVCFramwork.DataModuleCreate(Sender: TObject);
begin
  FMVC := TMVCEngine.Create(Self,
    procedure(Config: TMVCConfig)
    begin
      //enable static files
     // Config[TMVCConfigKey.DocumentRoot] := ExtractFilePath(GetModuleName(HInstance)) + '\www';
      // session timeout (0 means session cookie)
      Config[TMVCConfigKey.SessionTimeout] := '0';
      //default content-type
      Config[TMVCConfigKey.DefaultContentType] := TMVCConstants.DEFAULT_CONTENT_TYPE;
      //default content charset
      Config[TMVCConfigKey.DefaultContentCharset] := TMVCConstants.DEFAULT_CONTENT_CHARSET;
      //unhandled actions are permitted?
      Config[TMVCConfigKey.AllowUnhandledAction] := 'false';
      //default view file extension
      Config[TMVCConfigKey.DefaultViewFileExtension] := 'html';
      //view path
      Config[TMVCConfigKey.ViewPath] := 'templates';
      //Enable Server Signature in response
      Config[TMVCConfigKey.ExposeServerSignature] := 'true';
    end);

  TConfigRoutes.setupRoutes(FMVC);
  FMVC.AddSerializer(TMVCMediaType.APPLICATION_JSON, TMVCJsonDataObjectsSerializer.Create);

end;

procedure TWebModuleDMVCFramwork.DataModuleDestroy(Sender: TObject);
begin
  FMVC.Free;
end;

end.
