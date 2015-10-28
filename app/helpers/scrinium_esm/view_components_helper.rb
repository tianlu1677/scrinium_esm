module ScriniumEsm
  module ViewComponentsHelper
    def scrinium_esm_navbar_items
      if current_user and current_user.current_organization_id
        return {
          t('scrinium_esm.model') => scrinium_esm.models_path(organization_id: current_user.current_organization_id),
          t('activerecord.models.scrinium_esm/experiment') => scrinium_esm.experiments_path,
          t('scrinium_esm.data') => scrinium_esm.data_path
        }
      end
    end
  end
end
