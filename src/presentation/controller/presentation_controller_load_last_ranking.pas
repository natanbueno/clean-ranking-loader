unit presentation_controller_load_last_ranking;

interface

uses
  presentation_contract_controller,
  presentation_contract_http,

  presentation_viewmodel_rankingScore,
  presentation_viewmodel_server_error,

  domain_usecase_last_ranking_loader;
type

  TLoadLastRankingController  = class(TInterfacedObject, IController)
  private
    FLastRankingLoader: ILastRankingLoader;

  public
    constructor Create( aLastRankingLoader: ILastRankingLoader);
    destructor Destroy; override;
    class function New( aLastRankingLoader: ILastRankingLoader): IController;

    function handle(): THttpResponse;
  end;

implementation

uses
  System.SysUtils;

{ TLoadLastRankingController }

constructor TLoadLastRankingController.Create(aLastRankingLoader: ILastRankingLoader);
begin
  FLastRankingLoader := aLastRankingLoader;
end;

destructor TLoadLastRankingController.Destroy;
begin

  inherited;
end;

class function TLoadLastRankingController.New(aLastRankingLoader: ILastRankingLoader): IController;
begin
  Result := Self.Create(aLastRankingLoader);
end;

function TLoadLastRankingController.handle: THttpResponse;
var
  LRankings: TListRankingScore;
  LServerErrorViewModel: TServerErrorViewModel;
begin

  try
      LRankings := FLastRankingLoader.load;
      Result    := THttpHelper.serverOk( TRankingScoreViewModel.Map(LRankings) );

  except

    On E: Exception do
      begin
        LServerErrorViewModel := TServerErrorViewModel.Create;
        LServerErrorViewModel.MsgError := E.Message;

        Result := THttpHelper.serverError(LServerErrorViewModel.ToJson);
      end;

  end;

  if Assigned(LRankings) then
    FreeAndNil(LRankings);
end;

end.
