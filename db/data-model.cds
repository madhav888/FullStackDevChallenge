using { cuid, managed } from '@sap/cds/common';

namespace fullstack_dev_challenge; 

entity Tests:managed
{ 
  @Common.Label       : 'UUID' 
  key ID              : UUID;
      createdAt       : Timestamp @cds.on.insert : $now;
      createdBy       : String(255) @cds.on.insert: $user;
      modifiedAt      : Timestamp @cds.on.insert : $now  @cds.on.update : $now;
      modifiedBy      : String(255) @cds.on.insert: $user @cds.on.update: $user;
      title           : String;
      description     : String;
      
      Questions       : Association to many Questions on Questions.Test = $self
} 

entity Questions 
{ 
  @Common.Label       : 'UUID'
  key ID              : UUID;
      text            : String;
      Test            : Association to Tests;
      Answer          : Composition of 
      {
        @Common.Label : 'UUID'
        key ID        : UUID;
            text      : String;
      }

} 