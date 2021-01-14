unit domain_entitie_rankingScore;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TPlayer = class
  private
    FName   : String;
    FCountry: String;

  public
    property name   : string read FName    write FName;
    property country: string read FCountry write FCountry;
  end;

  THero = class
  private
    Fname : String;
    FLevel: Integer;
  public
    property name : string  read FName  write Fname;
    property level: Integer read FLevel write FLevel;
  end;

  TRankingScore = class
  private
    FPlayer   : TPlayer;
    FScore    : Integer;
    FmatchDate: TDate;
    FHeroes   : TObjectList<THero>;
  public
    constructor Create;
    destructor Destroy; override;

    property player   : TPlayer            read FPlayer    write FPlayer;
    property score    : Integer            read FScore     write Fscore;
    property matchDate: TDate              read FmatchDate write FmatchDate;
    property heroes   : TObjectList<THero> read FHeroes    write FHeroes;
  end;

implementation

constructor TRankingScore.Create;
begin
  FPlayer := TPlayer.Create;
  FHeroes := TObjectList<THero>.Create;
end;

destructor TRankingScore.Destroy;
begin
  FreeAndNil(FPlayer);
  FreeAndNil(FHeroes);
  inherited;
end;

end.
