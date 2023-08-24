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
    id                  INTEGER UNIQUE NOT NULL,    --Id
    posttypeid          INTEGER NOT NULL,           --PostTypeId
    parentid            INTEGER                     --ParentId
    creationdate        TIMESTAMP NOT NULL,         --CreationDate
    score               INTEGER,                    --Score
    viewcount           INTEGER,                    --ViewCount
    title               TEXT,                       --Title
    body                TEXT,                       --Body
    owneruserid         INTEGER,                    --OwnerUserId
    lastactivitydate    TIMESTAMP,                  --LastActivityDate
    tags                TEXT,                       --Tags
    answercount         INTEGER,                    --AnswerCount
    commentcount        INTEGER                     --CommentCount
    );

CREATE TABLE Tags (
    id                  INTEGER UNIQUE NOT NULL,    --Id
    name                TEXT UNIQUE NOT NULL,       --TagName
    count               INTEGER,                    --Count
    excerptpost         INTEGER,                    --ExcerptPostId
    wikipost            INTEGER                     --WikiPostId
);

CREATE TABLE Votes (
    id                  INTEGER UNIQUE NOT NULL,    --Id
    type                INTEGER NOT NULL,           --VoteTypeId
    postid              INTEGER NOT NULL,           --PostId
    creationdate        DATE NOT NULL,              --CreationDate
    bountyamount        SMALLINT                    --BountyAmount
);

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

