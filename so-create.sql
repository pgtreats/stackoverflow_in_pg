ALTER TABLE Comments DROP CONSTRAINT comments_id_fkey;
DROP TABLE Votes;
DROP TABLE Tags;
DROP TABLE Posts;
DROP TABLE Comments;
DROP TABLE Users;
DROP TABLE PostLinks;
DROP TABLE PostHistory;
DROP TABLE Badges;



CREATE TABLE Users (
    Id                  INTEGER NOT NULL,           --Id
    Reputation          INTEGER NOT NULL,           --Reputation
    CreationDate        TIMESTAMP NOT NULL,         --CreationDate
    DisplayName         TEXT,                       --DisplayName Yes, can be null some times
    LastAccessDate      TIMESTAMP,                  --LastAccessDate
    WebsiteUrl          TEXT,                       --WebsiteUrl
    Location            TEXT,                       --Location
    AboutMe             TEXT,                       --AboutMe
    Views               INTEGER,                    --Views
    UpVotes             INTEGER,                    --upvotes
    DownVotes           INTEGER,                    --downvotes
    Age                 INTEGER                     --age
);

CREATE TABLE Comments (
    Id                  INTEGER NOT NULL,           --Id
    PostId              INTEGER NOT NULL,           --PostId
    Score               INTEGER,                    --Score
    Text                TEXT,                       --Text
    CreationDate        TIMESTAMP NOT NULL,         --CreationDate
    UserId              INTEGER                     --UserId
);

CREATE TABLE Posts (
    Id                  INTEGER NOT NULL,           --Id
    PostTypeId          INTEGER NOT NULL,           --PostTypeId
    ParentId            INTEGER                     --ParentId
    CreationDate        TIMESTAMP NOT NULL,         --CreationDate
    Score               INTEGER,                    --Score
    ViewCount           INTEGER,                    --ViewCount
    Title               TEXT,                       --Title
    Body                TEXT,                       --Body
    OwnerUserId         INTEGER,                    --OwnerUserId
    LastActivityDate    TIMESTAMP,                  --LastActivityDate
    Tags                TEXT,                       --Tags
    AnswerCount         INTEGER,                    --AnswerCount
    CommentCount        INTEGER                     --CommentCount
);

CREATE TABLE Tags (
    Id                  INTEGER NOT NULL,           --Id
    TagName             TEXT NOT NULL,              --TagName
    Count               INTEGER,                    --Count
    ExcerptPostId       INTEGER,                    --ExcerptPostId
    WikiPostId          INTEGER                     --WikiPostId
);

CREATE TABLE Votes (
    Id                  INTEGER NOT NULL,           --Id
    VoteTypeId          INTEGER NOT NULL,           --VoteTypeId
    PostId              INTEGER NOT NULL,           --PostId
    UserId              INTEGER,                    --UserId
    CreationDate        DATE NOT NULL,              --CreationDate
    BountyAmount        SMALLINT                    --BountyAmount
);

COMMENT ON COLUMN Votes.CreationDate IS 'Time data purposefully removed to protect user privacy';


CREATE TABLE PostLinks (
    id                  INTEGER UNIQUE NOT NULL,    --Id
    creationdate        TIMESTAMP NOT NULL,         --CreationDate
    postid              INTEGER,                    --PostId
    relatedpostid       INTEGER,                    --RelatedPostId
    linktypeid          INTEGER                     --LinkTypeId
);

CREATE TABLE PostHistory (
    id                  INTEGER UNIQUE NOT NULL,    --Id
    type                INTEGER,                    --PostHistoryTypeId
    postid              INTEGER,                    --PostId
    revisionguid        TEXT,                       --RevisionGUID
    creation            TIMESTAMP NOT NULL,         --CreationDate
    userid              INTEGER,                    --UserId
    userdisplaymame     TEXT,                       --UserDisplayName
    text                TEXT                        --Text
);

CREATE TABLE Badges (
    id                  INTEGER UNIQUE NOT NULL,    --Id
    userid              INTEGER,                    --UserId
    name                TEXT,                       --Name
    date                TIMESTAMP,                  --Date
    class               INTEGER,                    --Class
    tagbased            TEXT                        --TagBased
);

