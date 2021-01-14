unit domain_usecase_last_ranking_loader;

interface

uses
  System.Generics.Collections,
  domain_entitie_rankingScore;

type
  TListRankingScore = TObjectList<TRankingScore>;
  TRankingScore     = domain_entitie_rankingScore.TRankingScore;
  THero             = domain_entitie_rankingScore.THero;

  ILastRankingLoader = interface
    ['{4D294925-C233-4936-88D7-C99051E984EB}']
    function load(): TListRankingScore;
  end;

implementation

end.
