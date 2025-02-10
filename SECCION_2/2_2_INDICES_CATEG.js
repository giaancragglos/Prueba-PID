db.categorias.createIndex({ nombre: 1 });
// OUTPUT: nombre_1

db.categorias.find({ nombre: "Electrónica" }).explain("executionStats");
/* OUTPUT:
{
    explainVersion: '1',
    queryPlanner: {
      namespace: 'PID.categorias',
      indexFilterSet: false,
      parsedQuery: {
        nombre: {
          '$eq': 'Electrónica'
        }
      },
      queryHash: 'A377EE26',
      planCacheKey: 'FAE4D511',
      maxIndexedOrSolutionsReached: false,
      maxIndexedAndSolutionsReached: false,
      maxScansToExplodeReached: false,
      winningPlan: {
        stage: 'FETCH',
        inputStage: {
          stage: 'IXSCAN',
          keyPattern: {
            nombre: 1
          },
          indexName: 'nombre_1',
          isMultiKey: false,
          multiKeyPaths: {
            nombre: []
          },
          isUnique: false,
          isSparse: false,
          isPartial: false,
          indexVersion: 2,
          direction: 'forward',
          indexBounds: {
            nombre: [
              '["Electrónica", "Electrónica"]'
            ]
          }
        }
      },
      rejectedPlans: []
    },
    executionStats: {
      executionSuccess: true,
      nReturned: 1,
      executionTimeMillis: 2,
      totalKeysExamined: 1,
      totalDocsExamined: 1,
      executionStages: {
        stage: 'FETCH',
        nReturned: 1,
        executionTimeMillisEstimate: 0,
        works: 2,
        advanced: 1,
        needTime: 0,
        needYield: 0,
        saveState: 0,
        restoreState: 0,
        isEOF: 1,
        docsExamined: 1,
        alreadyHasObj: 0,
        inputStage: {
          stage: 'IXSCAN',
          nReturned: 1,
          executionTimeMillisEstimate: 0,
          works: 2,
          advanced: 1,
          needTime: 0,
          needYield: 0,
          saveState: 0,
          restoreState: 0,
          isEOF: 1,
          keyPattern: {
            nombre: 1
          },
          indexName: 'nombre_1',
          isMultiKey: false,
          multiKeyPaths: {
            nombre: []
          },
          isUnique: false,
          isSparse: false,
          isPartial: false,
          indexVersion: 2,
          direction: 'forward',
          indexBounds: {
            nombre: [
              '["Electrónica", "Electrónica"]'
            ]
          },
          keysExamined: 1,
          seeks: 1,
          dupsTested: 0,
          dupsDropped: 0
        }
      }
    },
    command: {
      find: 'categorias',
      filter: {
        nombre: 'Electrónica'
      },
      '$db': 'PID'
    },
    serverInfo: {
      host: 'NBOS-GNUNEZ.local',
      port: 27017,
      version: '7.0.14',
      gitVersion: 'ce59cfc6a3c5e5c067dca0d30697edd68d4f5188'
    },
    serverParameters: {
      internalQueryFacetBufferSizeBytes: 104857600,
      internalQueryFacetMaxOutputDocSizeBytes: 104857600,
      internalLookupStageIntermediateDocumentMaxSizeBytes: 104857600,
      internalDocumentSourceGroupMaxMemoryBytes: 104857600,
      internalQueryMaxBlockingSortMemoryUsageBytes: 104857600,
      internalQueryProhibitBlockingMergeOnMongoS: 0,
      internalQueryMaxAddToSetBytes: 104857600,
      internalDocumentSourceSetWindowFieldsMaxMemoryBytes: 104857600,
      internalQueryFrameworkControl: 'trySbeRestricted'
    },
    ok: 1
  }
*/