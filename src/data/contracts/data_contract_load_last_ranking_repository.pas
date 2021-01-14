unit data_contract_load_last_ranking_repository;

interface

uses
  System.Generics.Collections,
  data_model_rankingScore;

type

  TRankingScoreModel     = data_model_rankingScore.TRankingScoreModel;
  THeroModel             = data_model_rankingScore.THeroModel;
  TListRankingScoreModel = TObjectList<TRankingScoreModel>;

  ILoadLastRankingRepository = interface
    ['{A79A2F64-3AEE-49DD-8707-C823A3566A12}']
    function loadLastRanking(): TListRankingScoreModel;
  end;

implementation

end.
