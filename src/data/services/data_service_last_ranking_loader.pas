unit data_service_last_ranking_loader;

interface

uses
  SysUtils,
  DateUtils,

  domain_usecase_last_ranking_loader,

  domain_error_ranking_unavailable,
  data_contract_load_last_ranking_repository;

type

  TLastRankingLoaderService = class(TInterfacedObject, ILastRankingLoader)
  private
    FloadLastRankingRepository: ILoadLastRankingRepository;

  public
    constructor Create(loadLastRankingRepository: ILoadLastRankingRepository);
    destructor Destroy; override;
    class function New(loadLastRankingRepository: ILoadLastRankingRepository): TLastRankingLoaderService;

   function load(): TListRankingScore;
  end;


implementation

constructor TLastRankingLoaderService.Create(loadLastRankingRepository: ILoadLastRankingRepository);
begin
  FloadLastRankingRepository := loadLastRankingRepository;
end;

destructor TLastRankingLoaderService.Destroy;
begin
  inherited;
end;

class function TLastRankingLoaderService.New(loadLastRankingRepository: ILoadLastRankingRepository): TLastRankingLoaderService;
begin
  Result := Self.Create(loadLastRankingRepository);
end;

function TLastRankingLoaderService.load: TListRankingScore;
var
  LListRankingScoreModel: TListRankingScoreModel;
  LRankingScore         : TRankingScore;
  LHero                 : THero;
  I,J: Integer;
begin
  if HourOf(Now) > 24 then
  begin
    raise TRankingUnavailableError.Create();
  end;

  LListRankingScoreModel := FloadLastRankingRepository.loadLastRanking();

  Result := TListRankingScore.Create;

  for I := 0 to Pred(LListRankingScoreModel.Count) do
  begin
    LRankingScore := TRankingScore.Create;

    LRankingScore.player.name    := LListRankingScoreModel[I].player.name;
    LRankingScore.player.country := LListRankingScoreModel[I].player.country;
    LRankingScore.score          := LListRankingScoreModel[I].score;
    LRankingScore.matchDate      := LListRankingScoreModel[I].matchDate;

    for J := 0 to LListRankingScoreModel[I].heroes.Count -1 do
    begin
      LHero := THero.Create;
      LHero.name  := LListRankingScoreModel[I].heroes.Items[J].name;
      LHero.level := LListRankingScoreModel[I].heroes.Items[J].level;

      LRankingScore.heroes.Add(LHero);
    end;

    Result.Add(LRankingScore);
  end;

  FreeAndNil(LListRankingScoreModel);
end;


end.
