mixin EntityConverter<Model, Entity> {
  Entity toEntity();
  Model fromEntity(Entity entity) => throw UnimplementedError();
}

// fromModel (datasources -> domain entities) for business logic 
// toModel (domain entities -> datasources) for data storing

// toEntity (datasources -> domain) for business logic
// toEntity (domain -> datasources) for data storing