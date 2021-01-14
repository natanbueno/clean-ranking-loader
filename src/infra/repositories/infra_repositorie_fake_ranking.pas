unit infra_repositorie_fake_ranking;

interface

uses
  data_contract_load_last_ranking_repository;

type

  TFakeRankingRepository = class(TInterfacedObject, ILoadLastRankingRepository)
  public
    class function New: ILoadLastRankingRepository;
    function loadLastRanking(): TListRankingScoreModel;
  end;

implementation

uses
  System.SysUtils;

{ TFakeRankingRepository }

class function TFakeRankingRepository.New: ILoadLastRankingRepository;
begin
  Result := Self.Create;
end;

function TFakeRankingRepository.loadLastRanking: TListRankingScoreModel;
var
  LRankingScoreModel1   : TRankingScoreModel;
  LRankingScoreModel2   : TRankingScoreModel;
  LHeroModel            : THeroModel;
  LListRankingScoreModel: TListRankingScoreModel;
  I: Integer;
begin

  LRankingScoreModel1                := TRankingScoreModel.Create;
  LRankingScoreModel1.player.name    := 'Player 01';
  LRankingScoreModel1.player.country := 'Brasil';
  LRankingScoreModel1.score := 10;
  LRankingScoreModel1.matchDate := Now + 30;

  for I := 0 to 2 do
  begin
    LHeroModel := THeroModel.Create;
    LHeroModel.name := 'Hero 00'+ I.ToString;
    LHeroModel.level := 2 + I;

    LRankingScoreModel1.heroes.Add(LHeroModel);
  end;

  LRankingScoreModel2 := TRankingScoreModel.Create;
  LRankingScoreModel2.player.name := 'Player 02';
  LRankingScoreModel2.player.country := 'Argentina';
  LRankingScoreModel2.score := 7;
  LRankingScoreModel2.matchDate := Now + 87;

  for I := 0 to 4 do
  begin
    LHeroModel := THeroModel.Create;
    LHeroModel.name := 'Hero 00'+ I.ToString;
    LHeroModel.level := 2 + I;

    LRankingScoreModel2.heroes.Add(LHeroModel);
  end;

  LListRankingScoreModel := TListRankingScoreModel.Create;
  LListRankingScoreModel.Add(LRankingScoreModel1);
  LListRankingScoreModel.Add(LRankingScoreModel2);

  Result := LListRankingScoreModel;
end;



end.







