/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author jdani
 */
@Embeddable
public class ComentarioPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "post_id")
    private int postId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "usuario_id")
    private int usuarioId;

    public ComentarioPK() {
    }

    public ComentarioPK(int postId, int usuarioId) {
        this.postId = postId;
        this.usuarioId = usuarioId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) postId;
        hash += (int) usuarioId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ComentarioPK)) {
            return false;
        }
        ComentarioPK other = (ComentarioPK) object;
        if (this.postId != other.postId) {
            return false;
        }
        if (this.usuarioId != other.usuarioId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.ComentarioPK[ postId=" + postId + ", usuarioId=" + usuarioId + " ]";
    }
    
}
