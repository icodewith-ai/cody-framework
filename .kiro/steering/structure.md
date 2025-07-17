# Project Structure

## Root Directory Organization
```
├── .vibedocs/                 # Vibedocs framework files
│   ├── .templates/           # Document templates
│   ├── project/              # Active project documents
│   └── start.md              # AI agent instructions
├── .kiro/                    # Kiro IDE configuration
│   ├── specs/                # Project specifications
│   └── steering/             # AI guidance rules
├── .git/                     # Version control
├── README.md                 # Project overview
├── LICENSE.md                # Custom license
└── .gitignore               # Git ignore patterns
```

## Vibedocs Framework Structure
The `.vibedocs/` directory contains the core framework:

### Templates (`.vibedocs/.templates/`)
- `plan/discovery.md` - Raw idea capture template
- `plan/prd.md` - Product Requirements Document template  
- `plan/plan.md` - Implementation plan template
- `work/feature-backlog.md` - Feature tracking template
- `work/version/` - Release-specific templates (design, tasklist, retrospective)

### Project Documents (`.vibedocs/project/`)
- `plan/` - Active planning documents (discovery, PRD, plan)
- `work/` - Active work documents (feature backlog, releases)
- `work/releases/` - Version-specific release folders

## Document Workflow Hierarchy
1. **Discovery Phase**: `.vibedocs/project/plan/discovery.md`
2. **Requirements Phase**: `.vibedocs/project/plan/prd.md` 
3. **Planning Phase**: `.vibedocs/project/plan/plan.md`
4. **Work Phase**: `.vibedocs/project/work/feature-backlog.md`
5. **Release Phase**: `.vibedocs/project/work/releases/v[x.y.z]/`

## Naming Conventions
- All documents use `.md` extension (Markdown)
- Release versions follow semantic versioning: `v0.1.0`, `v1.2.3`
- Template files mirror their active counterparts
- Folder names use lowercase with hyphens for multi-word names

## File Management Rules
- Templates are read-only reference files
- Project documents are working files that evolve
- Each release gets its own versioned folder
- All documents maintain consistent Markdown formatting