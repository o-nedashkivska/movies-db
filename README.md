Please note: all tables also include created_at and updated_at fields additionally to specified fields.

```mermaid
erDiagram
    file {
        string file_id PK
        string name
        string mime_type
        string key
        string url
    }
    user {
        string user_id PK
        string username
        string first_name
        string last_name
        string avatar_id FK
    }
    user_login {
        string user_id PK, FK
        string email
        string password
    }
    country {
        string country_id PK
        string name
    }
    person {
        string person_id PK
        string first_name
        string last_name
        string date_of_birth
        string gender
        string country_id FK
        string main_photo_id FK
    }
    person_detail {
        string person_id PK, FK
        string biography
    }
    person_photo {
        string person_id PK, FK
        string photo_id PK, FK
    }
    movie {
        string movie_id PK
        string director_id FK
        string country_id FK
        string title
        string budget
        string release_date
        string duration
        string poster_id FK
    }
    favorite_movie {
        string movie_id PK, FK
        string user_id PK, FK
    }
    movie_detail {
        string movie_id PK, FK
        string description
    }
    genre {
        string genre_id PK
        string name
    }
    movie_genre {
        string movie_id PK, FK
        string genre_id PK, FK
    }
    character {
        string character_id PK
        string name
        string role
    }
    character_detail {
        string character_id PK, FK
        string description
    }
    movie_actor {
        string movie_id PK, FK
        string person_id PK, FK
        string character_id FK
    }
    movie_character {
        string movie_id PK, FK
        string character_id PK, FK
    }
    user_login |o--|| user : "is detailed version of"
    file ||--o{ person_photo : "is included in"
    file |o--o{ person : "is main photo of"
    file |o--o{ user : "is avatar of"
    person_photo }o--|| person : "contains photos of"
    favorite_movie }o--|| user : "includes"
    favorite_movie }o--|| movie : "includes"
    movie_detail |o--|| movie : "is detailed version of"
    genre ||--o{ movie_genre : "is included in"
    movie_genre }o--|| movie : "includes"
    person ||--o| person_detail : "has detailed version"
    movie }o--o| person : "has director"
    country |o--o{ person : "is home country for"
    movie }o--o| country : "was filmed in"
    movie ||--o{ movie_actor : has
    movie ||--o{ movie_character : has
    person ||--o{ movie_actor : "is working as"
    movie_actor }o--o| character : plays
    movie_character }o--|| character : is
    character ||--o| character_detail : "has detailed version"
```